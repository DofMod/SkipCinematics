package
{
	import d2api.SystemApi;
	import d2hooks.Cinematic;
	import d2hooks.StopCinematic;
	import enums.CinematicEnum;
	import flash.display.Sprite;
	
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
		
		// APIs
		public var sysApi:SystemApi;
		
		//::///////////////////////////////////////////////////////////
		//::// Public methods
		//::///////////////////////////////////////////////////////////
		
		/**
		 * Entry point of the module.
		 */
		public function main():void
		{
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
				case CinematicEnum.SCARAPORT:
				case CinematicEnum.MINE:
					this.sysApi.dispatchHook(StopCinematic);
					
					break;
			}
		}
	}
}