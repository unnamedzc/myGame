package
{
	public class DeBug
	{
		public function DeBug()
		{
		}
		public static function LOG(...args):void
		{
			if(GlobalValue._deBug)
			{
				trace("[LOG]:",args)
			}
		}
	}
}