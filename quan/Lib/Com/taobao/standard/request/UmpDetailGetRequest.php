<?php
/**
 * TOP API: taobao.ump.detail.get request
 * 
 * @author auto create
 * @since 1.0, 2012-06-13 12:41:10
 */
class UmpDetailGetRequest
{
	/** 
	 * 活动详情的id
	 **/
	private $detailId;
	
	private $apiParas = array();
	
	public function setDetailId($detailId)
	{
		$this->detailId = $detailId;
		$this->apiParas["detail_id"] = $detailId;
	}

	public function getDetailId()
	{
		return $this->detailId;
	}

	public function getApiMethodName()
	{
		return "taobao.ump.detail.get";
	}
	
	public function getApiParas()
	{
		return $this->apiParas;
	}
	
	public function check()
	{
		
		RequestCheckUtil::checkNotNull($this->detailId,"detailId");
	}
}
