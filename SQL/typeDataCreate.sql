INSERT INTO Member.tAccountType ( fId,fAccountType, fAccountAuthority ) 
VALUES (0,'�޲z��', 3),
       (1,'���q�|��', 0), 
       (2,'�����H��', 1),     --�j���H����
       (3,'���H�|��', 1),     --�٧U�j�j
       (4,'���H�����H��', 1);


---------------------------------------------------------------------------
--���ΰѻP���v��
INSERT INTO Community.tAccessRight(fId,fName)
VALUES (1,'�f�֤�'),
	   (2,'�@��|��'),
	   (3,'���κ޲z��');
	   --(0,'�D�|������'),

--���Ϊ��A
INSERT INTO Community.tStatus(fId,fName)
VALUES(0,'�}��'),
      (1,'�b�}��'),
	  (2,'�p�K');


---------------------------------------------------------------------------
-- ���ʰѻP�̪��A����
insert into Activity.tJoinType(fId,fJoinName)
values (0,'�P����'),  (1,'�ڭn�ѥ[(�Ը�)'),  (2,'�ѥ['),  
       (3,'�h�X'),    (4,'���X�u'),         (5,'����');


-- ���ʪ��A����
insert into Activity.tActivityType(fId,fStatusName)
values (0,'�ݼf��'), (1,'�|���}�l'), (2,'�i�椤'), (3,'���⤤'), (4,'����');


-- ���ʻ{�Ҫ��A����
insert into Activity.tAttestType(fId, fAttestName, fPayCoin)
values (0,'�ݼf��', 0), (1, '���q�E�|', 0), (2, '�p���t����', 500), 
       (3,'���H����', 1000), (4, '�a�y��������', 5000);


-- ���ʥD����
insert into Activity.tActivityMainLabel(fId, fLabelName)
values (0, '��L'),(1 , '�b�y'), (2, '���]'), (3, '���ұШ|'), (4, '�G�⥫��');


-- ���ʼ���
insert into Activity.tActivityLabel(fLabelName)
values ('���'), ('�@�ɦa�y��'), ('�b��'), ('���O');


