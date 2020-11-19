package com.model2.mvc.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/*
 * FileName : PojoAspectJ.java
 *	:: XML �� ���������� aspect �� ����   
  */
@Aspect
public class LogAspectJ {

	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass());
	}
	
	//Around  Advice
	@Around("execution(* com.model2.mvc.service..*DaoImpl.*(..) )")
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("\n[Around before] Target Object.Method : "+
							joinPoint.getTarget().getClass().getName() +"."+
							joinPoint.getSignature().getName());
		
		if(joinPoint.getArgs().length !=0){
			System.out.println("[Around before] method Arguments : "+ joinPoint.getArgs()[0]);
		}
		//==> Ÿ�� ��ü�� Method �� ȣ�� �ϴ� �κ� 
		Object obj = joinPoint.proceed();

		System.out.println("[Around after] Target Object return value  : " + obj);
		System.out.println("");
		
		return obj;
	}
	
}//end of class