package ui
{
	import d2api.SystemApi;
	import d2api.UiApi;
	import d2components.ButtonContainer;
	import d2enums.ComponentHookList;
	import enums.ConfigEnum;
	
	/**
	 * Config UI script.
	 * 
	 * @author Relena
	 */
	public class ConfigUI
	{
		//::///////////////////////////////////////////////////////////
		//::// Variables
		//::///////////////////////////////////////////////////////////
		
		// APIs
		public var sysApi:SystemApi;
		public var uiApi:UiApi;
		
		// Components
		public var btn_cine_frigost_carrier:ButtonContainer;
		public var btn_cine_scaraport:ButtonContainer;
		public var btn_cine_mine:ButtonContainer;
		public var btn_cine_imp:ButtonContainer;
		
		//::///////////////////////////////////////////////////////////
		//::// Public methods
		//::///////////////////////////////////////////////////////////

		public function main(params:Object):void
		{
			btn_cine_frigost_carrier.selected = sysApi.getData(ConfigEnum.FRIGOST_CARRIER);
			btn_cine_scaraport.selected = sysApi.getData(ConfigEnum.SCARAPORT);
			btn_cine_mine.selected = sysApi.getData(ConfigEnum.MINE);
			btn_cine_imp.selected = sysApi.getData(ConfigEnum.IMP);
			
			uiApi.addComponentHook(btn_cine_frigost_carrier, ComponentHookList.ON_RELEASE);
			uiApi.addComponentHook(btn_cine_scaraport, ComponentHookList.ON_RELEASE);
			uiApi.addComponentHook(btn_cine_mine, ComponentHookList.ON_RELEASE);
			uiApi.addComponentHook(btn_cine_imp, ComponentHookList.ON_RELEASE);
		}
		
		//::///////////////////////////////////////////////////////////
		//::// Events
		//::///////////////////////////////////////////////////////////
		
		/**
		 * Mouse release callback.
		 *
		 * @param	target
		 */
		public function onRelease(target:Object):void
		{
			switch(target)
			{
				case btn_cine_frigost_carrier:
					sysApi.setData(ConfigEnum.FRIGOST_CARRIER, (target as ButtonContainer).selected);
					
					break;
				case btn_cine_scaraport:
					sysApi.setData(ConfigEnum.SCARAPORT, (target as ButtonContainer).selected);
					
					break;
				case btn_cine_mine:
					sysApi.setData(ConfigEnum.MINE, (target as ButtonContainer).selected);
					
					break;
				case btn_cine_imp:
					sysApi.setData(ConfigEnum.IMP, (target as ButtonContainer).selected);
					
					break;
			}
		}
	}
}