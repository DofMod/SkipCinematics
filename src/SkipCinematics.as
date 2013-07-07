package
{
	import d2api.SystemApi;
	import d2hooks.Cinematic;
	import d2hooks.StopCinematic;
	import enums.CinematicEnum;
	import flash.display.Sprite;
	
	public class SkipCinematics extends Sprite
	{
		public var sysApi:SystemApi;
		
		public function main():void
		{
			this.sysApi.addHook(Cinematic, onCinematic);
		}
		
		public function onCinematic(param1:int):void
		{
			switch (param1)
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