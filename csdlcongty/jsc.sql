use csdlspj;

#1
select mau,ThPho
from vattu
where TrLuong > 10 and ThPho not like 'Ha Noi';
#2
select *
from duan,vattu,ncc,cungcap
where duan.MaDA = cungcap.MaDA and vattu.MaVT = cungcap.MaVT and ncc.MaNCC = cungcap.MaNCC
order by duan.MaDA;
#3
select *
from duan,vattu,ncc,cungcap
where duan.MaDA = cungcap.MaDA
  and vattu.MaVT = cungcap.MaVT
  and ncc.MaNCC = cungcap.MaNCC
  and duan.ThPho = 'TpHCM';
#4
select Ten
from ncc, (select MaNCC
           from cungcap, duan
           where duan.MaDA = cungcap.MaDA and duan.MaDA = 'J1') as a1
where a1.MaNCC = ncc.MaNCC;
#5
select ncc.Ten, vattu.Ten, duan.Ten
from ncc, vattu, duan, (select *
                        from cungcap
                        where SLuong > 300 and SLuong < 750) as cc
where cc.MaNCC = ncc.MaNCC
  and cc.MaDA = duan.MaDA
  and cc.MaVT = vattu.MaVT;
#6
select *
from duan,vattu,ncc,cungcap
where duan.MaDA = cungcap.MaDA
  and vattu.MaVT = cungcap.MaVT
  and ncc.MaNCC = cungcap.MaNCC
  and ncc.ThPho = 'TpHCM';
#7
select MaVT
from vattu, ncc
where vattu.ThPho = 'TpHCM' and ncc.ThPho = 'TpHCM' group by MaVT;
#10
#14
select vattu.Ten , Mau, count(ncc.MaNCC)
from ncc, cungcap, vattu
where ncc.MaNCC = cungcap.MaNCC
  and cungcap.MaVT = vattu.MaVT
group by cungcap.MaVT;
#15
select  MaVT, sum(SLuong)
from cungcap
group by MaVT;
#16
select MaNCC, count(MaDA)
from cungcap
where MaNCC = 'S1';
#17
select MaNCC, count(a1.MaVT)
from  (select MaVT, MaNCC
       from cungcap
       where MaVT ='P1') as a1
where a1.MaNCC = 'S1';
#18
select Ten, duan.MaDA, count(MaVT) , sum(SLuong)
from cungcap, duan
where cungcap.MaDA = duan.MaDA group by duan.MaDA;
#19
select ten, vattu.MaVT, avg(SLuong)
from cungcap, vattu
where cungcap.MaVT = vattu.MaVT
order by cungcap.MaVT
         #41

