package net.idt.learning.handler;

import net.idt.learning.dao.CartLineDao;
import net.idt.learning.dao.OrderDetailDao;
import net.idt.learning.dao.ProductDao;
import net.idt.learning.dao.UserDao;
import net.idt.learning.dto.*;
import net.idt.learning.model.CheckoutModel;
import net.idt.learning.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class CheckoutHandler {
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private CartLineDao cartLineDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private HttpSession session;

    private String TRANSITIONAL_SUCCESS_VALUE = "success";

    public CheckoutModel init(String name) throws Exception{

        User user = userDao.getByEmail(name);
        CheckoutModel checkoutModel = null;

        if (user!=null) {
            checkoutModel = new CheckoutModel();
            checkoutModel.setUser(user);
            checkoutModel.setCart(user.getCart());

            double checkoutTotal = 0.0;
            List<CartLine> cartLines = cartLineDao.listAvailable(user.getCart().getId());

            if (cartLines.size() == 0 ) {
                throw new Exception("There are no products available for checkout now!");
            }

            for (CartLine cartLine: cartLines) {
                checkoutTotal += cartLine.getTotal();
            }

            checkoutModel.setCartLines(cartLines);
            checkoutModel.setCheckoutTotal(checkoutTotal);
        }

        return checkoutModel;
    }


    public List<Address> getShippingAddresses(CheckoutModel model) {

        List<Address> addresses = userDao.listShippingAddresses(model.getUser().getId());

        if(addresses.size() == 0) {
            addresses = new ArrayList<>();
        }

        addresses.add(addresses.size(), userDao.getBillingAddress(model.getUser().getId()));
        return addresses;

    }

    public String saveAddressSelection(CheckoutModel checkoutModel, int shippingId) {

        Address shipping = userDao.getAddress(shippingId);

        checkoutModel.setShipping(shipping);

        return TRANSITIONAL_SUCCESS_VALUE;

    }


    public String saveAddress(CheckoutModel checkoutModel, Address shipping) {

        // set the user id
        // set shipping as true
        shipping.setUserId(checkoutModel.getUser().getId());
        shipping.setShipping(true);
        userDao.addAddress(shipping);

        // set the shipping id to flowScope object
        checkoutModel.setShipping(shipping);

        return TRANSITIONAL_SUCCESS_VALUE;

    }


    public String saveOrder(CheckoutModel checkoutModel) {
        // create a new order object
        OrderDetail orderDetail = new OrderDetail();

        // attach the user
        orderDetail.setUser(checkoutModel.getUser());

        // attach the shipping address
        orderDetail.setShipping(checkoutModel.getShipping());

        // fetch the billing address
        Address billing = userDao.getBillingAddress(checkoutModel.getUser().getId());
        orderDetail.setBilling(billing);

        List<CartLine> cartLines = checkoutModel.getCartLines();
        OrderItem orderItem = null;

        double orderTotal = 0.0;
        int orderCount = 0;
        Product product = null;

        for(CartLine cartLine : cartLines) {

            orderItem = new OrderItem();

            orderItem.setBuyingPrice(cartLine.getBuyingPrice());
            orderItem.setProduct(cartLine.getProduct());
            orderItem.setProductCount(cartLine.getProductCount());
            orderItem.setTotal(cartLine.getTotal());

            orderItem.setOrderDetail(orderDetail);
            orderDetail.getOrderItems().add(orderItem);

            orderTotal += orderItem.getTotal();
            orderCount++;

            // update the product
            // reduce the quantity of product
            product = cartLine.getProduct();
            product.setQuantity(product.getQuantity() - cartLine.getProductCount());
            product.setPurchases(product.getPurchases() + cartLine.getProductCount());
            productDao.update(product);

            // delete the cartLine
            cartLineDao.remove(cartLine);
        }

        orderDetail.setOrderTotal(orderTotal);
        orderDetail.setOrderCount(orderCount);
        orderDetail.setOrderDate(new Date());

        // save the order
        orderDetailDao.add(orderDetail);

        // set it to the orderDetails of checkoutModel
        checkoutModel.setOrderDetail(orderDetail);


        // update the cart
        Cart cart = checkoutModel.getCart();
        cart.setGrandTotal(cart.getGrandTotal() - orderTotal);
        cart.setCartLines(cart.getCartLines() - orderCount);
        cartLineDao.updateCart(cart);

        // update the cart if its in the session
        UserModel userModel = (UserModel) session.getAttribute("userModel");
        if(userModel!=null) {
            userModel.setCart(cart);
        }

        return TRANSITIONAL_SUCCESS_VALUE;
    }


    public OrderDetail getOrderDetail(CheckoutModel checkoutModel) {
        return checkoutModel.getOrderDetail();
    }
}
