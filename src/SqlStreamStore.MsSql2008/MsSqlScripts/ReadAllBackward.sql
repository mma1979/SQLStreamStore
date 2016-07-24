     SELECT TOP(@count)
            dbo.Streams.IdOriginal As StreamId,
            dbo.Messages.StreamVersion,
            dbo.Messages.Ordinal,
            dbo.Messages.Id AS EventId,
            dbo.Messages.Created,
            dbo.Messages.Type,
            dbo.Messages.JsonData,
            dbo.Messages.JsonMetadata
       FROM dbo.Messages
 INNER JOIN dbo.Streams
         ON dbo.Messages.StreamIdInternal = dbo.Streams.IdInternal
      WHERE dbo.Messages.Ordinal <= @ordinal
   ORDER BY dbo.Messages.Ordinal DESC;
