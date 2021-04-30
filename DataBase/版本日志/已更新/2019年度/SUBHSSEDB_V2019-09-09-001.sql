--身份为空密码默认1111
UPDATE SitePerson_Person SET Password='202CB962AC59075B964B07152D234B70' 
WHERE IdentityCard IS NULL AND Password IS NULL
GO
--身份证末四位
UPDATE SitePerson_Person SET Password=substring(sys.fn_sqlvarbasetostr(HASHBYTES('MD5',cast(substring(IdentityCard,LEN(IdentityCard)-3,4) as varchar(100)))),3,32)
WHERE IdentityCard IS NOT NULL AND Password IS NULL  AND LEN(IdentityCard)>3
GO
--身份证小于4位
UPDATE SitePerson_Person SET Password=substring(sys.fn_sqlvarbasetostr(HASHBYTES('MD5',cast(IdentityCard as varchar(100)))),3,32)
WHERE IdentityCard IS NOT NULL AND Password IS NULL  AND LEN(IdentityCard) <4
GO