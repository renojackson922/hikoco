package org.silkdog.maven.simpleboard.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LoginAspect {
    @Pointcut("execution(public * org.silkdog.maven.simpleboard..*(..))")
    private void commonMethod(){}
}
