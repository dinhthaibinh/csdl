use csdlcongty;
#1
select TenNV , DChi
from nhanvien
where Phg = 5;
#2
select HoNV, TenNV, DChi, NgSinh
from phongban, nhanvien
where TrPhg = MaNV and MaPhg = 4;
#3
select TenNV , DChi
from nhanvien
where Phg = 5;
#4
select TenDA, HoNV, TenNV
from nhanvien, duan
where HoNV like 'Dinh%' group by HoNV;
#5
select HoNV, TenNV
from nhanvien, (select MaNV, count(TenTN) soLuongThanNhan
                from thannhan
                group by MaNV) as b1
where b1.MaNV = nhanvien.MaNV and soLuongThanNhan >= 3;
#6
select *
from nhanvien left join thannhan t on nhanvien.MaNV = t.MaNV
where isnull(t.MaNV)
group by nhanvien.MaNV
#7
select TrPhg
from phongban, (select MaNV, count(TenTN) soLuongThanNhan
                from thannhan
                group by MaNV) as b1
where TrPhg = b1.MaNV and soLuongThanNhan >= 1;
#8
select TenNV, b1.MaNV
from nhanvien, (select MaNV
                from phancong, duan
                where duan.MaDA = phancong.MaDA = 'San pham X' and Thoigian > 10
                group by MaNV) as b1
where b1.MaNV = nhanvien.MaNV and Phg = 5;
#9
select TenNV, nhanvien.MaNV
from thannhan, nhanvien
where TenNV like TenTN;
#10
select HoNV, TenNV
from nhanvien ,(select phancong.MaNV
                from duan, phancong
                where duan.MaDA = phancong.MaDA and Phong = 5
                group by MaNV) as b1
where b1.MaNV = nhanvien.MaNV;
#11
SELECT phancong.MaDA, TenDA, sum(Thoigian)
FROM duan, phancong
where phancong.MaDA = duan.MaDA group by phancong.MaDA;

#12
#13

#14
select Phg, avg(Luong)
from nhanvien
group by Phg;
#15
select avg(Luong)
from nhanvien
where Phai = 'F';

#16
select HoNV, TenNV
from nhanvien ,(select MaNV
                from phancong, (select TenDA, MaDA
                                from (select *
                                      from duan
                                      where Diadiem = 'Phu Nhuan') as a1, (select *
                                                                           from diadiem_phg
                                                                           where Diadiem != 'Phu Nhuan') as a2
                                where a1.Phong = a2.MaPhg group by MaDA) as b1
                where b1.MaDA = phancong.MaDA) as c1
where c1.MaNV = nhanvien.MaNV;
#17

#18

#19
select HoNV, TenNV
from nhanvien ,(select Phg, avg(Luong) as luongTrungBinh
                from nhanvien
                group by Phg)as b1
where nhanvien.Luong > luongTrungBinh group by TenNV;
#20
select nhanvien.Phg , count(nhanvien.MaNV)
from nhanvien,(select Phg, avg(Luong) as luongTrungBinh
               from nhanvien) as b1
where luongTrungBinh > 30000 group by nhanvien.Phg;
#21
select HoNV, TenNV, TenDA
from nhanvien, phancong, duan
where phancong.MaNV = nhanvien.MaNV and phancong.MaDA = duan.MaDA;
#22
select nhanvien.MaNQL, TenNV, HoNV, nhanvien.Phg, max(b1.soLuong)
from nhanvien, (select MaNQL, Phg, count(MaNV) as soLuong
                from nhanvien
                group by Phg) as b1
where b1.MaNQL = nhanvien.MaNQL;

#6,12,13,16,17,18