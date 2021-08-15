package com.student.controller;

import com.student.po.Score;
import com.student.service.findScoreService;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class adminfindScoreByStuCardController {
    @Autowired
    private findScoreService findScoreService;
    @RequestMapping("adminfindScoreByStuCard.do")
    public String findScoreByStuCard(String stuCard, HttpSession session){
        Score score=findScoreService.findScoreByStuId(stuCard);
        session.setAttribute("sco",score);
        return "AdminupdateStuS";
    }
}
