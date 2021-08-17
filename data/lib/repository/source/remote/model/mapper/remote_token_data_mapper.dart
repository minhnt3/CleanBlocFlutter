import 'package:domain/domain.dart';
import '../remote_token_data.dart';
import 'base/base_remote_data_mapper.dart';

class RemoteTokenDataMapper extends BaseRemoteDataMapper<RemoteTokenData, Token> {
  @override
  Token mapToEntity(RemoteTokenData? data) {
    return Token(accessToken: data?.accessToken ?? '', refreshToken: data?.refreshToken ?? '');
  }
}
