package{	import flash.display.*;	import flash.events.*;	public class Odor	{		public var x:Number=0;		public var y:Number=0;		public var i:Number = 4;		private var nex:Odor; //next		private var pre:Odor; //previus				public function Odor( x:Number=0, y:Number=0) {			init(x,y);		}				private function init(x:Number,y:Number):void {			this.x = x;			this.y = y;			if (!p) {				p = new Vector.<Odor>();			}			p.push( this );			OdorArea.addPoint(x,y);		}				/*Controle de particulas*/						static public var p:Vector.<Odor>;		//TODO: How to optimize it?		static public function update( img:BitmapData ):void {			var i:int = p.length;			var c:uint;//trace(i);//trace( uint( 2*0x7f << 24) );			while(i) {				i--;				p[i].i *= .98;				if (p[i].i>1) c=0xff000000; else c=255*p[i].i<<24;				//trace(c);c = uint(255*c<<24);				img.setPixel32(p[i].x,p[i].y,0xdf6a34|c);			}			var remove:Function = function(item:Odor, index:int, vector:Vector.<Odor>):Boolean {				if (int(item.i*100)>0) return true;				OdorArea.removePoint(item.x,item.y);				return false;			};			p = p.filter(remove);		}	}}