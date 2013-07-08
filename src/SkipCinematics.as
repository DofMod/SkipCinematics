package
{
	import d2api.SystemApi;
	import d2api.UiApi;
	import d2hooks.Cinematic;
	import d2hooks.StopCinematic;
	import enums.CinematicEnum;
	import enums.ConfigEnum;
	import flash.display.Sprite;
	import ui.ConfigUI;
	
	/**
	 * Main class of the module.
	 * 
	 * @author Yseult
	 */
	public class SkipCinematics extends Sprite
	{
		//::///////////////////////////////////////////////////////////
		//::// Variables
		//::///////////////////////////////////////////////////////////
		
		// Include UIs
		private const includeUI:Array = [ConfigUI];
		
		// APIs
		public var sysApi:SystemApi;
		public var uiApi:UiApi;
		
		// Modules
		[Module (name="Ankama_Common")]
		public var modCommon:Object;
		
		//::///////////////////////////////////////////////////////////
		//::// Public methods
		//::///////////////////////////////////////////////////////////
		
		/**
		 * Entry point of the module.
		 */
		public function main():void
		{
			modCommon.addOptionItem(
				"module_skipcinematics",
				"(M) SkipCinematics",
				"Options du module SkipCinematics",
				"SkipCinematics::config");
			
			this.sysApi.addHook(Cinematic, onCinematic);
		}
		
		//::///////////////////////////////////////////////////////////
		//::// Events
		//::///////////////////////////////////////////////////////////
		
		/**
		 * d2hook.Cinematic callback. Called when a cinematic start.
		 * 
		 * @param	cinematicId	Identifier of the cinematic.
		 */
		public function onCinematic(cinematicId:int):void
		{
			switch (cinematicId)
			{
				case CinematicEnum.FRIGOST_CARRIER:
					if (sysApi.getData(ConfigEnum.FRIGOST_CARRIER))
					{
						this.sysApi.dispatchHook(StopCinematic);
					}
					
					break;
				case CinematicEnum.SCARAPORT:
					if (sysApi.getData(ConfigEnum.SCARAPORT))
					{
						this.sysApi.dispatchHook(StopCinematic);
					}
					
					break;
				case CinematicEnum.MINE:
					if (sysApi.getData(ConfigEnum.MINE))
					{
						this.sysApi.dispatchHook(StopCinematic);
					}
					
					break;
				case CinematicEnum.IMP_CARRIER:
					if (sysApi.getData(ConfigEnum.IMP))
					{
						this.sysApi.dispatchHook(StopCinematic);
					}
					
					break;
			}
		}
	}
}