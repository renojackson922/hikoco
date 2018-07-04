package org.silkdog.maven.hikoco.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Aspect
public class LoginAspect {
    @Pointcut("execution(public * org.silkdog.maven.hikoco.item..*(..))")
    private void test(){}

    @Around(value="test()")
    public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
        // 주소 얻기
        HttpServletRequest req = null;
        for(Object o : joinPoint.getArgs()){
            if(o instanceof HttpServletRequest){
                req = (HttpServletRequest)o;
            }
        }

        // 주소가 있을 경우
        if(req != null){
            String strUrl = req.getRequestURL().toString();
            System.out.println("strUrl: " + strUrl);

            if(!strUrl.endsWith("/login")){
                // 세션을 체크함
                HttpSession session = req.getSession();

                String loginId = (String)session.getAttribute("loginId");
                if(loginId == null || "".equals(loginId)){
                    return "redirect:login.do";
                }
            }
        }

        Object result = joinPoint.proceed();
        return result;
    }
}
