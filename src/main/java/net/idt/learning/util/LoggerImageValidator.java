package net.idt.learning.util;

import net.idt.learning.dto.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class LoggerImageValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Logger.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Logger logger = (Logger) target;
        if ( (logger.getFile() == null) || (logger.getFile().getOriginalFilename().equals("")) ) {
            errors.rejectValue("file", null, "Please, select an image file to upload!");
            return;
        }
        if (!(logger.getFile().getContentType().equals("image/jpeg") ||
                logger.getFile().getContentType().equals("image/png") ||
                logger.getFile().getContentType().equals("image/gif")))
        {
            errors.rejectValue("file", null, "Please use only image file to upload!");
        }
    }
}
