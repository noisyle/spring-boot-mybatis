package com.noisyle.demo.mybatis.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.jxls.reader.ReaderBuilder;
import org.jxls.reader.XLSReadStatus;
import org.jxls.reader.XLSReader;
import org.jxls.template.SimpleExporter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.noisyle.demo.mybatis.model.Comment;
import com.noisyle.demo.mybatis.model.Topic;
import com.noisyle.demo.mybatis.repository.CommentRepository;
import com.noisyle.demo.mybatis.repository.TopicRepository;

@RestController
@RequestMapping(value="/api")
public class TopicController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private CommentRepository commentRepository;
    
    @RequestMapping(value="/topic/{id}", method=RequestMethod.GET)
    public Object findTopicById(@PathVariable Long id) {
        return topicRepository.findTopicById(id);
    }
    
    @RequestMapping(value="/topics/p{p:\\d+}", method=RequestMethod.GET)
    public Object findTopicByPage(@PathVariable int p, @RequestParam(required=false, defaultValue="") String order) {
        Page<Topic> page = PageHelper.startPage(p, 5);
        if("popular".equals(order)) {
            page.setOrderBy("commentcount desc");
        } else {
            page.setOrderBy("createtime desc");
        }
        topicRepository.findTopics();
        return page.toPageInfo();
    }
    
    @RequestMapping(value="/topic/{id}/comment", method=RequestMethod.POST)
    public Object comment(@PathVariable Long id, @RequestParam String content) {
        Comment comment = new Comment();
        comment.setUserId(1l);
        comment.setTopicId(id);
        comment.setContent(content);
        commentRepository.insert(comment);
        return comment;
    }
    
    @RequestMapping(value="/topics/export", method=RequestMethod.GET)
    public void export(HttpServletResponse response) throws IOException {
        String filename = new String(("测试导出_"+System.currentTimeMillis()).getBytes(), "iso-8859-1");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s.xls\"", filename));
        
        List<String> headers = Arrays.asList("主题", "创建时间");
        String propertyNames = "title, createTime";
        List<Topic> dataObjects = topicRepository.findTopics();
        new SimpleExporter().gridExport(headers, dataObjects, propertyNames, response.getOutputStream());
    }
    
    @RequestMapping(value="/topics/import", method=RequestMethod.POST)
    public Object upload(@RequestParam("file") MultipartFile file, ModelAndView model) throws IOException, SAXException, InvalidFormatException {
        XLSReader mainReader = ReaderBuilder.buildFromXML(new ClassPathResource("jxls/topic_import.xml").getInputStream());
        Map<String, Object> beans = new HashMap<String, Object>();
        List<Topic> topics = new LinkedList<Topic>();
        beans.put("topics", topics);
        XLSReadStatus readStatus = mainReader.read(file.getInputStream(), beans);
        
        for(Topic t: topics) {
            logger.debug("{}", t);
        }
        
        if(readStatus.isStatusOK()) {
            model.addObject("message", "上传成功, 读取" + topics.size() + "条数据");
        } else {
            model.addObject("message", "上传失败!");
        }
        
        model.setViewName("index");
        return model;
    }
}
