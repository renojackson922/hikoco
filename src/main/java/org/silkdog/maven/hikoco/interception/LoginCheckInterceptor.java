//package org.silkdog.maven.hikoco.interception;
//
//import org.springframework.web.portlet.handler.HandlerInterceptorAdapter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
//
//    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object obj) throws Exception{
//        boolean result = false;
//        String webRoot = req.getContextPath();
//
//        try{
//            String id = (String)req.getSession().getAttribute("test");
//            if(id == null){
//                if(isAjaxRequest(req)){
//                    resp.sendError(400);
//                    return false;
//                }else{
//                    resp.sendRedirect(webRoot + "/login.do");
//                    result = false;
//                }
//            }else{
//                result = true;
//            }
//        }catch(Exception e){
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//            return false;
//        }
//        return result;
//    }
//
//    private boolean isAjaxRequest(HttpServletRequest req){
//        String header = req.getHeader("AJAX");
//        if("true".equals(header)){
//            return true;
//        }else{
//            return false;
//        }
//    }
//
//
//}
