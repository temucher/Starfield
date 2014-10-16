//Teagan Mucher, Block 4 AP CS, Lowell High School

Particle[] bob = new Particle[400];
double oddX, oddY;
boolean seizure, seizureWarning;
void setup()
{
	background(0);
	seizureWarning=true;
	seizure=false;
	size(500,500);
	for(int i=0;i<(bob.length-1);i++)
	{
		bob[i]= new NormalParticle();
	}
	bob[bob.length-1] = new OddballParticle();
}
void draw()
{
	if(frameCount<120)
	{
		if(seizureWarning==true)
			{
				textSize(40);
				textAlign(CENTER);
				text("SEIZURE WARNING",250,250);
			}
			seizureWarning=false;
	}
	else
	{
		if(seizure==false)
			{
				background(0);
			}
		for(int i=0;i<bob.length;i++) 
		{
			bob[i].move();
			bob[i].show();
			bob[i].reset();
		}
	}
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	int r,g,b;
	NormalParticle()
	{
		r=(int)(Math.random()*255);
		g=(int)(Math.random()*255);
		b=(int)(Math.random()*255);
		x=550;
		y=250;
		speed=(Math.random()*7+1);
		angle=(Math.random()*2*(Math.PI));
	}
	void move()
	{
		x=x+Math.cos(angle)*speed;
		y=y+Math.sin(angle)*speed;

	}
	void show()
	{
		noStroke();
		fill(r,g,b);
		ellipse((float)x,(float)y,10,10);
	}
	void reset()
	{
		if(x<0||x>500)
		{
			x=250;
			y=250;
		}
		else if(y<0||y>500)
		{
			x=250;
			y=250;
		}
	}
}
interface Particle
{
	public void move();
	public void show();
	public void reset();
}
class OddballParticle implements Particle
{
	double speed, angle;
	int r,g,b;
	OddballParticle()
	{
		r=0;
		g=0;
		b=255;
		oddX=550;
		oddY=250;
		speed=(Math.random()*7+1);
		angle=(Math.random()*2*(Math.PI));
	}
	void move()
	{
		angle=(Math.random()*2*(Math.PI));
		oddX=oddX+Math.cos(angle)*speed;
		oddY=oddY+Math.sin(angle)*speed;
	}
	void show()
	{
		noStroke();
		fill(r,g,b);
		ellipse((float)oddX,(float)oddY,20,20);
	}
	void reset()
	{
		if(oddX<0||oddX>500)
		{
			oddX=250;
			oddY=250;
		}
		else if(oddY<0||oddY>500)
		{
			oddX=250;
			oddY=250;
		}
	}
}
void mousePressed()
{
	if(mouseButton == LEFT)
	{
		oddX=mouseX;
		oddY=mouseY;
	}
	if(mouseButton == RIGHT)
	{
		seizure= !seizure;
	}
}



