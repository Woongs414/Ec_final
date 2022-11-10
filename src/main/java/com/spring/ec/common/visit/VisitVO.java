package com.spring.ec.common.visit;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("visitVO")
public class VisitVO {
	private int visit_num;
	private String visit_kind;
	private String visit_ip;
	private Date visit_date;
	
		public VisitVO() {
			
		}
		public VisitVO(int visit_num,String visit_kind,String visit_ip,Date visit_date) {
			this.visit_num = visit_num;
			this.visit_kind = visit_kind;
			this.visit_ip = visit_ip;
			this.visit_date = visit_date;
		}
		public int getVisit_num() {
			return visit_num;
		}
		public void setVisit_num(int visit_num) {
			this.visit_num = visit_num;
		}
		public String getVisit_kind() {
			return visit_kind;
		}
		public void setVisit_kind(String visit_kind) {
			this.visit_kind = visit_kind;
		}
		public String getVisit_ip() {
			return visit_ip;
		}
		public void setVisit_ip(String visit_ip) {
			this.visit_ip = visit_ip;
		}
		public Date getVisit_date() {
			return visit_date;
		}
		public void setVisit_date(Date visit_date) {
			this.visit_date = visit_date;
		}
		
}
