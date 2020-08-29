USE SeaTurtleOnTheWay;
GO


--�|���v��
INSERT INTO Member.tAccountType ( fId,fAccountType, fAccountAuthority ) 
VALUES (0,'�޲z��', 5),
       (1,'���q�|��', 1), 
       (2,'�����H��', 2),     --�j���H����
       (3,'���H�|��', 2),     --�٧U�j�j
       (4,'���H�����H��', 2),
	   (5,'�X��', 0);


---------------------------------------------------------------------------
--���ΰѻP���v��
INSERT INTO Community.tAccessRight(fId,fName)
VALUES (0,'�D�|������'), 
       (1,'�f�֤�'),
	   (2,'�@��|��'),
	   (3,'���κ޲z��');



--���Ϊ��A
INSERT INTO Community.tStatus(fId,fName)
VALUES(0,'���v'),
      (1,'�}��'),
	  (2,'�p�K');







---------------------------------------------------------------------------
-- ���ʰѻP�̪��A����
insert into Activity.tJoinType(fId,fJoinName)
values (0,'�P����'),  
       (1,'�ڭn�ѥ[(�Ը�)'),  
	   (2,'�ѥ['),  
       (3,'�h�X'),    
	   (4,'���X�u'),         
	   (5,'����');


-- ���ʪ��A����
insert into Activity.tActivityType(fId,fStatusName)
values (0,'�ݼf��'), 
       (1,'�|���}�l'), 
	   (2,'�i�椤'), 
	   (3,'���⤤'), 
	   (4,'����');


-- ���ʻ{�Ҫ��A����
insert into Activity.tAttestType(fId, fAttestName, fPayCoin)
values (0,'�ݼf��', 0), 
       (1, '���q�E�|', 0), 
	   (2, '�p���t����', 500), 
       (3,'���H����', 1000), 
	   (4, '�a�y��������', 5000);


-- ���ʥD����
insert into Activity.tActivityMainLabel(fId, fLabelName)
values (0, '��L'),
       (1 , '�Ӥu����'), 
	   (2, '���ҲM��'), 
	   (3, '�۵M�Ш|'), 
	   (4, '�G�⥫��'),
	   (5,'�B��'),
	   (6,'�u�W����');


-- ���ʼ���
insert into Activity.tActivityLabel(fLabelName)
values ('���'), ('�@�ɦa�y��'), ('�b��'), ('���O'),('�����s'),('����'),('2020'),('���]'),('���@�U���s�L'),
       ('���ڹF'),('��ê��'),('���y��'),('�K�H�T��'),('������'),('�����t�۷|'),('AR'),('�n�Q�X�h��'),('����'),
	   ('�b�y'),('����'),('���s'),('�b��'),('�@��n��'),('Discovery'),('�m�L��'),('�֩�j�۵M'),('�߫}���U'),
	   ('���h�y���ʪ�'),('�Ⱦv��'),('���]'),('���D����'),('�¦�'),('���m�Ш|'),('�����'),('�Ш|'),('�@�j��'),
	   ('����'),('�q��'),('��i�N���ʶR'), ('��C'),('�žv'),('����'),('���q'),('��Ǫ̤͵�'),('�P������'),
	   ('�j��'),('���h'), ('���ҫO�@'),('�v�j�]��'),('�N�ʧA�@��');


