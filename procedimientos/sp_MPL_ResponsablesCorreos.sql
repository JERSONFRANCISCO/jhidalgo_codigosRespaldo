

create or replace procedure dbo.sp_MPL_ResponsablesCorreos
as
BEGIN TRAN
    select  res.Cedula,vistaUser.NombreUsuario,res.Email,mplU.Descripcion
    from MPL_Responsables res, MPL_ResponsableUnidad mplU ,MPLV_Usuarios vistaUser
    where (res.Login=mplU.UsuarioResponsable and  res.TipoUsuario = 'J' and mplU.CodigoUE = 40000 and res.Cedula = vistaUser.CedulaFormato) 
    or (res.TipoUsuario = 'A' and res.Login=mplU.UsuarioResponsable and res.Cedula = vistaUser.CedulaFormato)
COMMIT TRAN



exec sp_MPL_ResponsablesCorreos
