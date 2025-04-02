package com.imovie.moviems.utility;

import com.imovie.moviems.exception.MovieException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

	private static final Logger LOGGER = LogManager.getLogger(LoggingAspect.class);

	@AfterThrowing(pointcut = "execution(* com.imovie.moviems.service.MovieServiceImpl.*(..))", throwing = "exception")
	public void logServiceException(MovieException exception) {
		LOGGER.error(exception.getMessage());
	}

}
