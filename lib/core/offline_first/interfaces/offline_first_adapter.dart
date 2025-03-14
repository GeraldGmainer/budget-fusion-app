abstract class OfflineFirstAdapter<Entity, LocalDto, RemoteDto> {
  LocalDto toLocalDto(Entity entity);

  RemoteDto toRemoteDto(Entity entity);

  Entity fromLocalDto(LocalDto dto);

  Entity fromRemoteDto(RemoteDto dto);
}
