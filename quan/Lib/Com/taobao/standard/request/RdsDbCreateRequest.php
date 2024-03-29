<?php
/**
 * TOP API: taobao.rds.db.create request
 * 
 * @author auto create
 * @since 1.0, 2012-06-13 12:41:10
 */
class RdsDbCreateRequest
{
	/** 
	 * 数据库名
	 **/
	private $dbName;
	
	/** 
	 * rds的实例名
	 **/
	private $instanceName;
	
	private $apiParas = array();
	
	public function setDbName($dbName)
	{
		$this->dbName = $dbName;
		$this->apiParas["db_name"] = $dbName;
	}

	public function getDbName()
	{
		return $this->dbName;
	}

	public function setInstanceName($instanceName)
	{
		$this->instanceName = $instanceName;
		$this->apiParas["instance_name"] = $instanceName;
	}

	public function getInstanceName()
	{
		return $this->instanceName;
	}

	public function getApiMethodName()
	{
		return "taobao.rds.db.create";
	}
	
	public function getApiParas()
	{
		return $this->apiParas;
	}
	
	public function check()
	{
		
		RequestCheckUtil::checkNotNull($this->dbName,"dbName");
		RequestCheckUtil::checkMaxLength($this->dbName,64,"dbName");
		RequestCheckUtil::checkNotNull($this->instanceName,"instanceName");
		RequestCheckUtil::checkMaxLength($this->instanceName,30,"instanceName");
	}
}
