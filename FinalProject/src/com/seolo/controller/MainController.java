/*==========================
   MainController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(Model model)
	{
		
		return "WEB-INF/view/Main.jsp";
	}
}
