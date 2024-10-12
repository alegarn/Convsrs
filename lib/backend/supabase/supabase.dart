import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://wmhjqorgspvxacgwexos.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndtaGpxb3Jnc3B2eGFjZ3dleG9zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1NzU2NDEsImV4cCI6MjAyNDE1MTY0MX0.XmC4f5AttU_eOJWYJEtZGuE3qIa6-ck76oAwTCjjGk0';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
