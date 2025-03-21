abstract class OfflineFirstAdapter<LocalDto, RemoteDto> {
  LocalDto toLocalDto(RemoteDto remote);

  RemoteDto toRemoteDto(LocalDto local);
}
