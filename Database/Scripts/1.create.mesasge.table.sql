Use [Message]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Messages](
	[MessagesId] [uniqueidentifier] NOT NULL,
	[Messages] [varchar](5000) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_MessagesId]  DEFAULT (newsequentialid()) FOR [MessagesId]
GO



INSERT INTO [dbo].[Messages] 
	([Messages])
VALUES
	('This is my First Message!'),
	('This is my Second Message!');
