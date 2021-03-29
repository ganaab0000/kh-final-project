package com.example.demo.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

import org.apache.ibatis.annotations.Delete;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.IamportService;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.AgainPaymentData;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.request.CardInfo;
import com.siot.IamportRestClient.request.ExtraNaverUseCfmEntry;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class BillingRestController {

	@GetMapping("/api/billing/token")
	public String getBilling() throws UnsupportedEncodingException {
		//pg설정(정기결제 및 키인결제) - 나이스페이먼즈(KG이니시스)
		String test_api_key = "aaaaa";
		String test_api_secret = "bbbbb";
		IamportService client = new IamportService(test_api_key, test_api_secret);
		try {
	        //card_num, date_expired_six_num, birth_six_num, pwd_two_num
			CardInfo card = new CardInfo("111123", "3333", "363636", "123435");
			String test_customer_uid = "customer_123456";
			String merchantUid = "order_id_9123"+"10";
			long amount = 16l; //결제 금액.

			//0. getToken
			IamportResponse<AccessToken> auth_response = client.getAuth();
			System.out.println(auth_response.getResponse());
			System.out.println(auth_response.getResponse().getToken());

			//0. create Billing Key.
			IamportResponse create_billing_key = client.postBillingCustomer(test_customer_uid, card);
			System.out.println(create_billing_key.getResponse());
			System.out.println(create_billing_key.getMessage());
//			System.out.println(create_billing_key.getResponse().getMessage());
//			System.out.println(create_billing_key.getResponse().getCode());

			//0. delete Billing Key.
//			IamportResponse del_billing_key = client.deleteBillingCustomer(test_customer_uid);
//			System.out.println(del_billing_key.getResponse());
//			System.out.println(del_billing_key.getMessage());

			//0. get Pay //실제 결제
			AgainPaymentData again_data = new AgainPaymentData(test_customer_uid, merchantUid, BigDecimal.valueOf(amount));
			again_data.setExtra(new ExtraNaverUseCfmEntry("20200101"));
//			ExtraNaverUseCfmEntry extra = again_data.getExtra();
			again_data.setName("최초결제테스트");
			IamportResponse<Payment> again_payment_response = client.againPayment(again_data);
			System.out.println(again_payment_response.getMessage());
			System.out.println(again_payment_response.getResponse());
//			assertEquals(payment_response.getResponse().getStatus(), "paid");

			//0. get Cancel //환불. 결제 취소.
			CancelData cancelData = new CancelData(merchantUid, false);
			IamportResponse<Payment> cancel_pay = client.cancelPaymentByImpUid(cancelData);
			System.out.println(cancel_pay.getMessage());
			System.out.println(cancel_pay.getResponse());

		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());

			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		return "test";
	}


}


