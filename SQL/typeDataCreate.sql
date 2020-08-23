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



-- ���Τ���
insert into Community.tCommunityClass(fId, fName)
values (0, '��L'),
       (1 , '�b�y'), 
	   (2, '���]'), 
	   (3, '���ұШ|'), 
	   (4, '�G�⥫��');




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
       (1 , '�b�y'), 
	   (2, '���]'), 
	   (3, '���ұШ|'), 
	   (4, '�G�⥫��');


-- ���ʼ���
insert into Activity.tActivityLabel(fLabelName)
values ('���'), ('�@�ɦa�y��'), ('�b��'), ('���O');


