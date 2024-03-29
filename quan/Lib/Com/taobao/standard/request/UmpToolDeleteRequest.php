<?php
/**
 * TOP API: taobao.ump.tool.delete request
 * 
 * @author auto create
 * @since 1.0, 2012-06-13 12:41:10
 */
class UmpToolDeleteRequest
{
	/** 
	 * 营销工具id
	 **/
	private $toolId;
	
	private $apiParas = array();
	
	public function setToolId($toolId)
	{
		$this->toolId = $toolId;
		$this->apiParas["tool_id"] = $toolId;
	}

	public function getToolId()
	{
		return $this->toolId;
	}

	public function getApiMethodName()
	{
		return "taobao.ump.tool.delete";
	}
	
	public function getApiParas()
	{
		return $this->apiParas;
	}
	
	public function check()
	{
		
		RequestCheckUtil::checkNotNull($this->toolId,"toolId");
	}
}
