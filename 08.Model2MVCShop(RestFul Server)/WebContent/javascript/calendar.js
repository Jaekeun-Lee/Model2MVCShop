		function show_calendar(str_target, str_datetime) 
		{ 

		   var arr_months = ["1��", "2��", "3��", "4��", "5��", "6��","7��", "8��", "9��", "10��", "11��", "12��"]; 
	        var week_days = ["��", "ȭ", "��", "��", "��", "��", "��"]; 
	        var n_weekstart = 0; 
	
	        var dt_datetime = ((str_datetime ==null||str_datetime=="")? new Date():tuning2dt(str_datetime,str_target));
	        
	        if(dt_datetime == false)
	        {
	        	if (str_target.indexOf(".") > 0)
	        	{    
			    	var num1 = str_target.split(".")[0];
			    	var num2 = str_target.split(".")[1];
			    	var num3 = str_target.split(".")[2];
				}
	        	return document.all(num3).focus();
	        	
	        }
			else
			{
		        var dt_prev_year = new Date(dt_datetime); 
		        dt_prev_year.setYear(dt_datetime.getYear()-1+1900);
		        var dt_prev_month = new Date(dt_datetime); 
		        dt_prev_month.setMonth(dt_datetime.getMonth()-1);
		        var dt_next_month = new Date(dt_datetime); 
		        dt_next_month.setMonth(dt_datetime.getMonth()+1);
		        var dt_next_year = new Date(dt_datetime); 
		        dt_next_year.setYear(dt_datetime.getYear()+1+1900);
		        
		        var dt_firstday = new Date(dt_datetime); 
		        dt_firstday.setDate(1); 
		        dt_firstday.setDate(1-(7+dt_firstday.getDay()-n_weekstart)%7); 
		        var dt_lastday = new Date(dt_next_month); 
		        dt_lastday.setDate(0); 
		         
		        var str_buffer = new String (
		                "<html>\n"+ 
		                "<head>\n"+ 
		                "<title>Calendar</title>\n"+ 
		                "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"+
		                "<style>\n"+
	                    "td {font-size: 11px; color: #222222; text-decoration: none; font-family:verdana, ����; line-height:15px}\n"+
	                    "A:link    {font-size: 11px; color: #222222; text-decoration: none; font-family:verdana, ����}\n"+
	                    "A:visited {font-size: 11px; color: #222222; text-decoration: none; font-family:verdana, ����}\n"+
	                    "A:active  {font-size: 11px; color: #222222; text-decoration: none; font-family:verdana, ����}\n"+
	                    "A:hover   {font-size: 11px; color: #222222; text-decoration: none; font-family:verdana, ����}\n"+
	                    "</style>\n"+ 
		                "</head>\n"+
		                "<body background=\"/eMarketPlace/images/others/ct_diary_bg2.gif\" style=\"margin:8\">\n"+ 
		                "<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" bgcolor=\"C5C5C5\">\n"+ 
		                "<tr><td align=\"center\" background=\"/eMarketPlace/images/others/ct_diary_bg.gif\" bgcolor=\"#ffffff\" style=\"border:FFFFFF solid 1px; padding:11 9 9 9\">\n"+ 
		                "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+ 
		                "<tr>\n  <td height=\"20\" align=\"center\">\n"+
		                "<!-- -------- �� ǥ�� S  -------- -->\n"+
		                "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>\n"+
		                "<td>"+
						"<a href=\"javascript:window.opener.show_calendar('"+ str_target+"', '"+ tuning(dt_prev_year)+"');\">"+ 
		                "<img src=\"/images/others/ct_diary_btn1.gif\" width=\"15\" height=\"13\" border=\"0\"></a> "+					
						"<a href=\"javascript:window.opener.show_calendar('"+ str_target+"', '"+ tuning(dt_prev_month)+"');\">"+ 
		                "<img src=\"/images/others/ct_diary_btn1.gif\" width=\"15\" height=\"13\" border=\"0\"></a>"+
						"</td>\n"+ 
		                "<td align=\"center\"  width=\"85\"><font size=\"2\">" 
		                +dt_datetime.getFullYear()+"�� "+arr_months[dt_datetime.getMonth()]+"</font></td>\n"+ 
		                "<td align=\"right\">"+
						"<a href=\"javascript:window.opener.show_calendar('" +str_target+"', '"+tuning(dt_next_month)+"');\">"+ 
		                "<img src=\"/images/others/ct_diary_btn2.gif\" width=\"15\" height=\"13\" border=\"0\"></a> "+
						"<a href=\"javascript:window.opener.show_calendar('" +str_target+"', '"+tuning(dt_next_year)+"');\">"+ 
		                "<img src=\"/images/others/ct_diary_btn2.gif\" width=\"15\" height=\"13\" border=\"0\"></a>"+
						"</td>\n</tr>\n</table>\n"+ 
		                "<!-- -------- �� ǥ�� E  -------- -->\n"+
		                "</td>\n</tr>\n<tr>\n<td bgcolor=\"EBEFF7\" height=\"1\">\n</td>\n</tr>\n<tr>\n"+
						"<td height=\"23\" align=\"center\" valign=\"bottom\"><img src=\"/images/others/ct_diary_title.gif\"></td>\n"+
					    "</tr>\n<tr>\n<td bgcolor=\"E5E5E5\" height=\"2\"></td>\n"+
					    "</tr>\n<tr>\n<td>\n"+
					    "<!-- -------- ��¥ ����Ʈ ���̺� S  -------- -->\n"+
						"<table width=\"168\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"E5E5E5\">\n"
		        ); 
		
		        var dt_current_day = new Date(dt_firstday);

		        while (dt_current_day.getMonth() == dt_datetime.getMonth() || dt_current_day.getMonth() == dt_firstday.getMonth()) {
		                str_buffer += "<tr align=\"center\" bgcolor=\"#FFFFFF\">\n";
		                for (var n_current_wday=0; n_current_wday<7; n_current_wday++) {
		                        if(dt_current_day.getDate() == dt_datetime.getDate() && dt_current_day.getMonth() == dt_datetime.getMonth()){
		                                str_buffer += "<td width=\"24\" bgcolor=\"#EFE6A6\">";
		                        }else if (dt_current_day.getDay() == 0){
		                                str_buffer += "<td width=\"24\" height=\"21\" bgcolor=\"FEF6F4\">";
		                        }else if (dt_current_day.getDay() == 6){
		                                str_buffer += "<td width=\"24\" bgcolor=\"F4FAFE\">";
		                        }else{
		                                str_buffer += "<td width=\"24\">";
		                        }
	
		                        if (dt_current_day.getMonth() == dt_datetime.getMonth()){
		                                str_buffer += "<a href=\"javascript:window.opener."+str_target+
		                                ".value='"+tuning_date(dt_current_day)+"'; window.close();\">";
		                                if(dt_current_day.getDay() == 0){
		                                    str_buffer += "<font color=\"E02200\">";    
		                                }else if(dt_current_day.getDay() == 6){
		                                    str_buffer += "<font color=\"046EAC\">";   
		                                }
		                                str_buffer += dt_current_day.getDate();
		                                if(dt_current_day.getDay() == 0 || dt_current_day.getDay() == 6){
		                                    str_buffer += "</font>"; 
		                                }
		                                str_buffer += "</a>";
		                        }
		                        else{
		                                str_buffer += "<a href=\"javascript:window.opener."+str_target+
		                                ".value='"+tuning_date(dt_current_day)+"'+document.cal.time.value; window.close();\"></a>";
		                        }
		                        str_buffer += "</td>\n";        
		                        dt_current_day.setDate(dt_current_day.getDate()+1);
		                        
		                }
		                str_buffer += "</tr>\n";
		        }
		        str_buffer +=
		                "</table>\n" +
		                "<!-- -------- ��¥ ����Ʈ ���̺� E  -------- -->\n"+
		                "</td>\n</tr>\n</table>\n</td>\n</tr>\n</table>\n" +
		                "</body>\n" +
		                "</html>\n";
	
		        var vWinCal = window.open("", "Calendar",
		                "width=207,height=220,status=no,resizable=no,top=200,left=200");
		        vWinCal.focus();
		        vWinCal.opener = self;
		        var calc_doc = vWinCal.document;
		        calc_doc.write (str_buffer);
		        calc_doc.close();
		    }//else end    
		}

		function str2dt (str_datetime,str_target)
		{
			var re_date = /^(\d+)\-(\d+)\-(\d+)$/; 
	        if (!re_date.exec(str_datetime))
				return errorTurn("��¥ ������ �߸� �Ǿ����ϴ�. ����('YYYYMMDD')",str_target); 

			return (new Date (RegExp.$1, RegExp.$2-1, RegExp.$3)); 
		}
		
		function dt2dtstr (dt_datetime)
		{
			return(new String(""+dt_datetime.getFullYear()+"-"+(dt_datetime.getMonth()+1)+"-"+dt_datetime.getDate()+""));
		}
		
		function tuning2dt (str_datetime,str_target)
		{
			var yr = str_datetime.substr(0,4);
			var mo = str_datetime.substr(4,2);
			var dy = str_datetime.substr(6,2);
			
			if(mo.indexOf('0')==0) mo = mo.substr(1,1);
			if(dy.indexOf('0')==0) dy = dy.substr(1,1);
			
			return (str2dt(new String(""+yr+"-"+mo+"-"+dy+""),str_target));
		}
		
		function tuning (dt_datetime)
		{
	       	var mo ="";
	        var dy ="";
	        if( (dt_datetime.getMonth()+1).toString().length==1) mo = "0" + (dt_datetime.getMonth()+1).toString();
	        else mo = (dt_datetime.getMonth()+1).toString();
	        if( dt_datetime.getDate().toString().length==1) dy = "0" + dt_datetime.getDate().toString();
	        else dy = dt_datetime.getDate().toString();
	        return(new String(""+dt_datetime.getFullYear()+mo+dy+"")); 
		}
		
		function tuning_date (dt_datetime)
		{
	       	var mo ="";
	        var dy ="";
	        if( (dt_datetime.getMonth()+1).toString().length==1) mo = "0" + (dt_datetime.getMonth()+1).toString();
	        else mo = (dt_datetime.getMonth()+1).toString();
	        if( dt_datetime.getDate().toString().length==1) dy = "0" + dt_datetime.getDate().toString();
	        else dy = dt_datetime.getDate().toString();
	        return(new String(""+dt_datetime.getFullYear()+"-"+mo+"-"+dy+"")); 
		}

		function errorTurn(x,str_target)
		{
			alert(x);
			return false;
		}
