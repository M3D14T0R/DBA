/****************************************************/
/* Created by: SQL Server 2014 Profiler          */
/* Date: 25/09/2015  03:21:29         */
/****************************************************/


-- Create a Queue
declare @rc int
declare @TraceID int
declare @maxfilesize bigint
set @maxfilesize = 500

-- Please replace the text InsertFileNameHere, with an appropriate
-- filename prefixed by a path, e.g., c:\MyFolder\MyTrace. The .trc extension
-- will be appended to the filename automatically. If you are writing from
-- remote server to local drive, please use UNC path and make sure server has
-- write access to your network share

exec @rc = sp_trace_create @TraceID output, 0, N'E:\MS SQL Database\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Log\Block', @maxfilesize, NULL 
if (@rc != 0) goto error

-- Client side File and Table cannot be scripted

-- Set the events
declare @on bit
set @on = 1
exec sp_trace_setevent @TraceID, 137, 1, @on
exec sp_trace_setevent @TraceID, 137, 13, @on
exec sp_trace_setevent @TraceID, 137, 22, @on
exec sp_trace_setevent @TraceID, 137, 15, @on
exec sp_trace_setevent @TraceID, 137, 32, @on
exec sp_trace_setevent @TraceID, 148, 1, @on
exec sp_trace_setevent @TraceID, 148, 12, @on
exec sp_trace_setevent @TraceID, 148, 11, @on
exec sp_trace_setevent @TraceID, 148, 14, @on


-- Set the Filters
declare @intfilter int
declare @bigintfilter bigint

set @intfilter = 5
exec sp_trace_setfilter @TraceID, 3, 0, 0, @intfilter

-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1

-- display trace id for future references
select TraceID=@TraceID
goto finish

error: 
select ErrorCode=@rc

finish: 
go



--SELECT *
--FROM    ::fn_trace_gettable( 'E:\SIGNA\Trace_Block_DeadLock.trc', DEFAULT) T
