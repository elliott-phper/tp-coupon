<?php
/**
 * TOP API: taobao.wlb.wlborder.get request
 * 
 * @author auto create
 * @since 1.0, 2012-06-13 12:41:10
 */
class WlbWlborderGetRequest
{
	/** 
	 * 物流宝订单编码
	 **/
	private $wlbOrderCode;
	
	private $apiParas = array();
	
	public function setWlbOrderCode($wlbOrderCode)
	{
		$this->wlbOrderCode = $wlbOrderCode;
		$this->apiParas["wlb_order_code"] = $wlbOrderCode;
	}

	public function getWlbOrderCode()
	{
		return $this->wlbOrderCode;
	}

	public function getApiMethodName()
	{
		return "taobao.wlb.wlborder.get";
	}
	
	public function getApiParas()
	{
		return $this->apiParas;
	}
	
	public function check()
	{
		
		RequestCheckUtil::checkNotNull($this->wlbOrderCode,"wlbOrderCode");
	}
}
