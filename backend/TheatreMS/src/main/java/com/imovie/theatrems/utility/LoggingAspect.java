package com.imovie.theatrems.utility;

import com.imovie.theatrems.exception.TheatreException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

	private static final Logger LOGGER = LogManager.getLogger(LoggingAspect.class);

	@AfterThrowing(pointcut = "execution(* com.imovie.theatrems.service.*ServiceImpl.*(..))", throwing = "exception")
	public void logServiceException(TheatreException exception) {
		LOGGER.error(exception.getMessage());
	}

}
