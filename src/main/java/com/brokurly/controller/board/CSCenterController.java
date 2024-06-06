package com.brokurly.controller.board;

import com.brokurly.dto.board.InquiryDto;
import com.brokurly.dto.board.NoticeBoardDto;
import com.brokurly.dto.board.NoticeListDto;
import com.brokurly.dto.board.FAQListDto;
import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.service.board.FAQService;
import com.brokurly.service.board.InquiryService;
import com.brokurly.service.board.NoticeService;
import com.brokurly.utils.BoardPageHandler;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import retrofit2.http.HTTP;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class CSCenterController {
    private final NoticeService noticeService;
    private final FAQService faqService;
    private final InquiryService inquiryService;

    @GetMapping("/notice")
    public String notice(Integer page, Model model) throws Exception {
        BoardPageHandler noticePageHandler = new BoardPageHandler();
//        페이지를 처음 호출한 시점이므로 page는 0
        if (page == null) {page = 0;}

//        Service측에 현 페이지 번호와 pagesize을 전달해 필요한 리스트를 가져온다.
        List<NoticeListDto> noticeListDtoList = noticeService.getList();

//        핸들링으로 15개만 추린다
        noticeListDtoList = noticePageHandler.getPagedNoticeList(noticeListDtoList, page);

//        페이지에서 보여줄 값을 Model에 넣는다
        model.addAttribute("noticePageHandler", noticePageHandler);
        model.addAttribute("noticeListDtoList", noticeListDtoList);
        model.addAttribute("pageNo", page);

        return "board/noticeList";
    }

    @RequestMapping("/detail")
    public String noticeboard(int bno, Model model) throws Exception {
        NoticeBoardDto noticeBoardDto = noticeService.getBoard(bno);
        model.addAttribute("noticeBoardDto", noticeBoardDto);
        return "board/noticeBoard";
    }

//    @RequestMapping("/faqboard")
//    public String faq(Integer page, Model model) throws Exception {
//        BoardPageHandler faqPageHandler = new BoardPageHandler();
//
//        if (page == null) {page = 0;}
//
//        List<FAQListDto> FAQListDtoList = faqService.getFaqList();
//
//        FAQListDtoList = faqPageHandler.getPagedFAQList(FAQListDtoList, page);
//
//        model.addAttribute("faqPageHandler", faqPageHandler);
//        model.addAttribute("FAQListDtoList", FAQListDtoList);
//        model.addAttribute("pageNo", page);
//
//        return "board/faqList";
//    }

    @RequestMapping("/faqboard")
    public String faq(Integer page, Integer catecode, Model model) {
        BoardPageHandler faqPageHandler = new BoardPageHandler();
        if (page == null) {page = 0;}

        if (catecode != null) {
            List<FAQListDto> FAQListDtoList = faqService.getFaqSortedList(catecode, faqPageHandler.getPagesize());
            FAQListDtoList = faqPageHandler.getPagedFAQList(FAQListDtoList, page);
            model.addAttribute("FAQListDtoList", FAQListDtoList);
        } else {
            List<FAQListDto> FAQListDtoList = faqService.getFaqList();
            FAQListDtoList = faqPageHandler.getPagedFAQList(FAQListDtoList, page);
            model.addAttribute("FAQListDtoList", FAQListDtoList);
        }

        model.addAttribute("faqPageHandler", faqPageHandler);
        model.addAttribute("pageNo", page);

        return "board/faqList";
    }

    @RequestMapping("/inquiry")
    public String inquiry(HttpSession session, HttpServletRequest request, Model model) {
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        if (custIdDto == null) {
            return "redirect:/login-check?redirectURI=" + request.getRequestURI();
        }
        String custId = custIdDto.getCustId();
        List<InquiryDto> inquiryDtoList = inquiryService.getOneCustInquiryList(custId);
        model.addAttribute("InquiryDtoList", inquiryDtoList);
            return "board/inquiryList";

    }
    @RequestMapping("/inquiryPost")
    public String inquiryPost() {
        return "board/inquiryPost";
    }
}

