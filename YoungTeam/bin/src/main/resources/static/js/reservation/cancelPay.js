function cancelPay(mid) {
    jQuery.ajax({
      "url": "/cancelPay", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": mid, // 예: ORD20180131-0000011
        "imp_key" : "2084092403007437",
        "imp_secret" : "8b48a41554813ef9e4a0d67ff5f8713dbab200bc12f2f6bb153863d846404ae7ab2d4b1e56e3bfa7"
      }),
      "dataType": "json"
    });
  }