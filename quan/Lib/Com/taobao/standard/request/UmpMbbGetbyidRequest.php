<?php
/**
 * TOP API: taobao.ump.mbb.getbyid request
 * 
 * @author auto create
 * @since 1.0, 2012-06-13 12:41:10
 */
class UmpMbbGetbyidRequest
{
	/** 
	 * 积木块的id
	 **/
	private $id;
	
	private $apiParas = array();
	
	public function setId($id)
	{
		$this->id = $id;
		$this->apiParas["id"] = $id;
	}

	public function getId()
	{
		return $this->id;
	}

	public function getApiMethodName()
	{
		return "taobao.ump.mbb.getbyid";
	}
	
	public function getApiParas()
	{
		return $this->apiParas;
	}
	
	public function check()
	{
		
		RequestCheckUtil::checkNotNull($this->id,"id");
	}
}
