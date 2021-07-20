package com.ict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MyDAOImpl")
public class MyDAOImpl implements MyDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
