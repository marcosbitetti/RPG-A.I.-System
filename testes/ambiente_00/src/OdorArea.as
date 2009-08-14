package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;

	public class OdorArea
	{
		public var rec:Rectangle;
		public var length:uint = 0;

		public function OdorArea(x:int=0, y:int=0, width:int=1, height:int=1) {
			if (!matrix) initMatrix();
			rec = new Rectangle( x,y, width, height );
		}

		static private var matrix:Array;
		static private const xP:int = 8;
		static private const yP:int = 8;
		static private var w:Number = 1;
		static private var h:Number = 1;

		static public function initMatrix():void {

			OdorArea.matrix = new Array();
			for (var i:int=0; i<yP;i++) {
				var l:Array = new Array();
				for (var i2:int=0; i2<xP;i2++)
					l.push( new OdorArea(i2,i) );
				OdorArea.matrix.push( l );
			}
		}

		static public function calcule(s:Stage):void {
			w = s.stageWidth / xP;
			h = s.stageHeight / yP;
		}

		static public function getInstance(x:int, y:int):OdorArea {
			x /= w;
			y /= h;

			if (x>-1 && y>-1)
				if (y<matrix.length)
					if (x<matrix[y].length)
						return matrix[y][x] as OdorArea;
			return null;
		}

		static public function addPoint(x:int, y:int):void {
			var o:OdorArea = getInstance(x,y);
			if (o) o.length++;
		}

		static public function removePoint(x:int, y:int):void {
			var o:OdorArea = getInstance(x,y);
			if (o) o.length--;
		}

		static public function draw(g:Graphics):void {
			//g.lineStyle( 1,0x00ff00, .02);
			g.lineStyle( 0,0x00ff00, 0);
			var o:OdorArea;
			var y:int=0;
			var x:int=0;
			while (y<yP) {
				x=0;
				while (x<xP) {
					o = OdorArea(matrix[y][x]);

					var c:uint = uint(o.length);
					if(c>255) c=255;
					c = 255-c;
					c = c | 0xff00 | c<<16;
//trace(o.length);
					g.beginFill(c,1);
					//g.lineStyle( 1,0x00ff00<<c, .02);
					g.drawRect( o.rec.x*w,o.rec.y*h,o.rec.width*w,o.rec.height*h );
					g.endFill();
					x++;
				}
				y++;
			}
		}
	}
}