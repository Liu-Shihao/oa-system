package com.lsh.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

@Slf4j
@Component
public class RequestInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        log.info("Request URL::" + request.getRequestURL().toString() +
                ":: Start Time=" + System.currentTimeMillis());

        // 判断请求方式是否为POST
//        if(request.getMethod().equalsIgnoreCase("POST")) {
//            // 获取请求体中的参数
//            BufferedReader reader = request.getReader();
//            StringBuilder sb = new StringBuilder();
//            String line;
//            while ((line = reader.readLine()) != null) {
//                sb.append(line);
//            }
//            System.out.println("Request Body : " + sb.toString());
//        } else {
//            // 打印其他请求参数信息
//            Enumeration<String> parameterNames = request.getParameterNames();
//            while (parameterNames.hasMoreElements()) {
//                String paramName = parameterNames.nextElement();
//                System.out.println(paramName + " : " + request.getParameter(paramName));
//            }
//        }

        // 打印请求参数信息
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            System.out.println(paramName + " : " + request.getParameter(paramName));
        }
        return true;
    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        System.out.println("Request URL::" + request.getRequestURL().toString() +
                " Sent to Handler :: Current Time=" + System.currentTimeMillis());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                Exception ex) throws Exception {
        System.out.println("Request URL::" + request.getRequestURL().toString() +
                ":: End Time=" + System.currentTimeMillis());
    }
}
