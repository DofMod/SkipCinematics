package
{
	import d2api.SystemApi;
	import d2hooks.Cinematic;
	import d2hooks.StopCinematic;
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
			if (param1 == 2)
			{
				this.sysApi.dispatchHook(StopCinematic);
			}
			else if (param1 == 4)
			{
				this.sysApi.dispatchHook(StopCinematic);
			}
			else if (param1 == 5)
			{
				this.sysApi.dispatchHook(StopCinematic);
			}
		}
	}
}