#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<time.h>

int a[7][7]={0},b[7][7]={0},c[7][7]={0},d[7][7]={0};
int CS=0,HS=0;

void main()
{
	void CREAT_HC();
	void SHOW();
	int FIGHT();
	int kz,k;
	char c;

	while(1)
	{
		CREAT_HC();
		kz=FIGHT();
		SHOW();
		printf("---------------------------------------------------\n");
		if(kz==0)
		{printf("���Ե÷�!\n"); CS++;}
		else
		{printf("��ҵ÷�!\n"); HS++;}
		if(CS>=10||HS>=10) break;
		printf("����:���=%d:%d\n",CS,HS);
		printf("---------------------------------------------------\n");
		printf("������?(Y/N)");
		do
		{
			c=getche(); k=1;
			if(c=='y'||c=='Y') k=1;
			else if (c=='n'||c=='N') exit(0);
			else {printf("����ѡ����������������!\n"); k=0;}
		}while(k==0);
	}
	printf("����:���=%d:%d\n",CS,HS);
	printf("---------------------------------------------------\n");
	if(CS>=10) printf("���Ի�ʤ!\n");
	else printf("��һ�ʤ\n");
	c=getch();
}

void CL(int x[][7])//�������
{
	int i,j;
	for(i=0;i<7;i++)
		for(j=0;j<7;j++)
			x[j][i]=0;
}

void CREAT(int a[][7])//����ɻ�����
{
	int x,y,k;
	srand(time(NULL));
	k=rand()%2;
	if(k==0)//�������
	{
		x=rand()%3+2;
		y=rand()%7;
		a[x][y]=2;
		if(y<3)
		{
			a[x-2][y+1]=a[x-1][y+1]=a[x][y+1]=a[x+1][y+1]=a[x+2][y+1]=1;
			a[x][y+2]=a[x-1][y+3]=a[x][y+3]=a[x+1][y+3]=1;
		}
		if(y>3)
		{
			a[x-2][y-1]=a[x-1][y-1]=a[x][y-1]=a[x+1][y-1]=a[x+2][y-1]=1;
			a[x][y-2]=a[x-1][y-3]=a[x][y-3]=a[x+1][y-3]=1;
		}
		if(y==3)
		{
			k=rand()%2;
			if(k==0)
			{
				a[x-2][y+1]=a[x-1][y+1]=a[x][y+1]=a[x+1][y+1]=a[x+2][y+1]=1;
				a[x][y+2]=a[x-1][y+3]=a[x][y+3]=a[x+1][y+3]=1;
			}
			else
			{
				a[x-2][y-1]=a[x-1][y-1]=a[x][y-1]=a[x+1][y-1]=a[x+2][y-1]=1;
				a[x][y-2]=a[x-1][y-3]=a[x][y-3]=a[x+1][y-3]=1;
			}
		}
	}
	else//��������
	{
		y=rand()%3+2;
		x=rand()%7;
		a[x][y]=2;
		if(x<3)
		{
			a[x+1][y-2]=a[x+1][y-1]=a[x+1][y]=a[x+1][y+1]=a[x+1][y+2]=1;
			a[x+2][y]=a[x+3][y-1]=a[x+3][y]=a[x+3][y+1]=1;
		}
		if(x>3)
		{
			a[x-1][y-2]=a[x-1][y-1]=a[x-1][y]=a[x-1][y+1]=a[x-1][y+2]=1;
			a[x-2][y]=a[x-3][y-1]=a[x-3][y]=a[x-3][y+1]=1;
		}
		if(x==3)
		{
			k=rand()%2;
			if(k==0)
			{
				a[x+1][y-2]=a[x+1][y-1]=a[x+1][y]=a[x+1][y+1]=a[x+1][y+2]=1;
				a[x+2][y]=a[x+3][y-1]=a[x+3][y]=a[x+3][y+1]=1;
			}
			else
			{
				a[x-1][y-2]=a[x-1][y-1]=a[x-1][y]=a[x-1][y+1]=a[x-1][y+2]=1;
				a[x-2][y]=a[x-3][y-1]=a[x-3][y]=a[x-3][y+1]=1;
			}
		}
	}
}

void CREAT_HC()//������Һ͵��Եķɻ�
{
	int i,j,k;
	char ch;

bb:	system("cls");
	CL(a); CREAT(a);
	for(i=0;i<7;i++)
	{
		for(j=0;j<7;j++)
			printf("%d ",a[j][i]);
		printf("\n");
	}
	printf("0����ո�1�������2�����ͷ\n");
	printf("ȷ��Ҫ��һ����?(Y/N)");
	do
	{
		ch=getche(); k=1;
		if(ch=='y'||ch=='Y') k=1;
		else if (ch=='n'||ch=='N') {goto bb;}
		else {printf("����ѡ����������������!\n"); k=0;}
	}while(k==0);

	CL(b); CREAT(b);
	CL(c); CL(d);
}

void SHOW()
{
	int i,j;
	system("cls");
	printf("\t�ɻ���ս��Ϸ(19��10ʤ)\n");
	printf("---------------------------------------------------\n");
	printf("Y��\t��ҵķɻ���\t\t���Եķɻ���\n");
	for(i=0;i<7;i++)
	{
		printf("%d\t",i);
		for(j=0;j<7;j++)
		{
			printf("%d ",c[j][i]);
		}
		printf("\t\t");
		for(j=0;j<7;j++)
		{
			printf("%d ",d[j][i]);
		}
		printf("\n");
	}
	printf("---------------------------------------------------\n");
	printf("X��\t0 1 2 3 4 5 6\t\t0 1 2 3 4 5 6\n");
	printf("----------------------------------------------------------------------------\n");
	printf("0����û�д���ĸ��ӣ�1��������û�����еĸ��ӣ�2�������л���3�������л�ͷ\n");
	printf("����������������ң���������������ϵ��£�����Ϊ0��6\n");
	printf("----------------------------------------------------------------------------\n");
}

int BEAT(int a[][7],int b[][7],int x,int y)//�������
{
	if(a[x][y]==0)
	{
		b[x][y]=1;
		return 0;
	}
	else if(a[x][y]==1)
	{
		b[x][y]=2;
		return 1;
	}
	else
	{
		b[x][y]=3;
		return 2;
	}
}

int ATTACK()//��ҽ���
{
	int x,y;
	SHOW();
	printf("Ҫ�������(�м��ÿո����)��");
	scanf("%d %d",&x,&y);
	return(BEAT(b,d,x,y));
}

int FIGHT()//��ս����
{
	int k,t;
	int o[4],x[9]={3},y[9]={3};
	k=BEAT(a,c,3,3);
	if(k==2) return 0;
	t=ATTACK();
	if(t==2) return 1;
	if(k==0)//��һ��û�л��л���
	{
		k=BEAT(a,c,3,2); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[0]=k;
		k=BEAT(a,c,2,3); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[1]=k;
		k=BEAT(a,c,3,4); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[2]=k;
		k=BEAT(a,c,4,3); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[3]=k;
		if(o[3]==0)
		{
			k=BEAT(a,c,2,1); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,2,5); if(k==2) return 0;
		}
		if(o[2]==0)
		{
			k=BEAT(a,c,5,2); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,1,2); if(k==2) return 0;
		}
		if(o[1]==0)
		{
			k=BEAT(a,c,4,1); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,4,5); if(k==2) return 0;
		}
		if(o[0]==0)
		{
			k=BEAT(a,c,5,4); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,1,4); if(k==2) return 0;
		}
	}
	if(k==1)//��һ�λ��л���
	{
		k=BEAT(a,c,3,1); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		if(k==1) {x[1]=3; y[1]=1; goto cc;}
		k=BEAT(a,c,1,3); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		if(k==1) {x[1]=1; y[1]=3; goto cc;}
		k=BEAT(a,c,3,5); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		if(k==1) {x[1]=3; y[1]=5; goto cc;}
		k=BEAT(a,c,5,3); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		x[1]=5; y[1]=3;
cc:		if(x[1]==3)
		{
			x[2]=x[3]=3;
			x[4]=2; x[5]=4;
			if(y[1]>3)
			{y[2]=2; y[3]=6;}
			else
			{y[2]=0; y[3]=4;}
		}
		else
		{
			y[2]=y[3]=3;
			y[4]=2; y[5]=4;
			if(x[1]>3)
			{x[2]=2; x[3]=6;}
			else
			{x[2]=0; x[3]=4;}
		}
		k=BEAT(a,c,x[2],y[2]); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[0]=k;
		k=BEAT(a,c,x[3],y[3]); if(k==2) return 0;
		t=ATTACK(); if(t==2) return 1;
		o[1]=k;

		if(o[0]==1&&o[1]==1)
		{
			if(x[1]==3)
				y[4]=y[5]=(y[0]+y[1])/2;
			else
				x[4]=x[5]=(x[0]+x[1])/2;

			k=BEAT(a,c,x[4],y[4]); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,x[5],y[5]); if(k==2) return 0;
		}
		else if(o[0]==1||o[1]==1)
		{
			if(x[1]==3)
				y[4]=y[5]=3;
			else
				x[4]=x[5]=3;

			k=BEAT(a,c,x[4],y[4]); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,x[5],y[5]); if(k==2) return 0;
		}
		if(o[0]==0&&o[1]==0)
		{
			if(x[1]==3)
			{y[4]=y[5]=(y[0]+y[1])/2; x[4]=0; x[5]=6;}
			else
			{x[4]=x[5]=(x[0]+x[1])/2; y[4]=0; y[4]=6;}
			k=BEAT(a,c,x[4],y[4]); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,x[5],y[5]); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;

			if(x[1]==3)
			{y[6]=(y[0]+y[1])/2; x[6]=2;}
			else
			{x[6]=(x[0]+x[1])/2; y[6]=2;}
			k=BEAT(a,c,x[6],y[6]);
			t=ATTACK(); if(t==2) return 1;

			if(k==1)
			{
				if(x[1]==3)
				{x[7]=x[8]=2; y[7]=y[6]-2; y[8]=y[6]+2;}
				else
				{y[7]=y[8]=2; x[7]=x[6]-2; x[8]=x[6]+2;}
			}
			else
			{
				if(x[1]==3)
				{x[7]=x[8]=4; y[7]=y[6]-2; y[8]=y[6]+2;}
				else
				{y[7]=y[8]=4; x[7]=x[6]-2; x[8]=x[6]+2;}
			}
			k=BEAT(a,c,x[7],y[7]); if(k==2) return 0;
			t=ATTACK(); if(t==2) return 1;
			k=BEAT(a,c,x[8],y[8]); if(k==2) return 0;
		}
	}
	return 0;
}