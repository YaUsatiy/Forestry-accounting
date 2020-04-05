package net.idt.learning.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUtil {
    private static final String ABS_PATH = "C:/Users/ilukyanchik/IdeaProjects/OnlineShopBoot/src/main/webapp/assets/images";
    private static String REAL_PATH = null;

    public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
        REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
        if (!new File(ABS_PATH).exists()) {
            new File(ABS_PATH).mkdirs();
        }
        if (!new File(REAL_PATH).exists()) {
            new File(REAL_PATH).mkdirs();
        }
        try {
            //server upload
            file.transferTo(new File(REAL_PATH + code + ".jpg"));
            //project directory upload
            file.transferTo(new File(ABS_PATH + code + ".jpg"));
        } catch(IOException ignored) {
        }
    }
}
