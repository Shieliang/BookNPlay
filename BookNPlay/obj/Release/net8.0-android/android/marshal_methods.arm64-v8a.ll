; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [179 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [358 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 50
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 178
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 60
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 123
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 73
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 90
	i64 419206457763497962, ; 6: Auth0.OidcClient.Core.dll => 0x5d1520d628b07ea => 35
	i64 435118502366263740, ; 7: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 91
	i64 486223428996552534, ; 8: ZstdSharp.dll => 0x6bf69a1eecfd756 => 99
	i64 545109961164950392, ; 9: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 10: System.Reflection.Primitives => 0x7c6829760de3975 => 144
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 168
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 111
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 78
	i64 875677659902526502, ; 15: IdentityModel.dll => 0xc270831303c4426 => 39
	i64 1010599046655515943, ; 16: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 144
	i64 1120440138749646132, ; 17: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 95
	i64 1121665720830085036, ; 18: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 19: System.Drawing.dll => 0x119be62002c19ebb => 118
	i64 1369545283391376210, ; 20: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 86
	i64 1476839205573959279, ; 21: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 131
	i64 1486715745332614827, ; 22: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 57
	i64 1513467482682125403, ; 23: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 177
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 168
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 70
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 83
	i64 1731380447121279447, ; 28: Newtonsoft.Json => 0x18071957e9b889d7 => 64
	i64 1735388228521408345, ; 29: System.Net.Mail.dll => 0x181556663c69b759 => 128
	i64 1743969030606105336, ; 30: System.Memory.dll => 0x1833d297e88f2af8 => 126
	i64 1767386781656293639, ; 31: System.Private.Uri.dll => 0x188704e9f5582107 => 139
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 69
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 146
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 90
	i64 1865037103900624886, ; 36: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 42
	i64 1875417405349196092, ; 37: System.Drawing.Primitives => 0x1a06d2319b6c713c => 117
	i64 1881198190668717030, ; 38: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 39: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 91
	i64 1920760634179481754, ; 40: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 58
	i64 1930726298510463061, ; 41: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1959996714666907089, ; 42: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 43: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 155
	i64 1981742497975770890, ; 44: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 82
	i64 1983698669889758782, ; 45: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 46: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 47: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 117
	i64 2133195048986300728, ; 48: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 64
	i64 2165725771938924357, ; 49: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 71
	i64 2262844636196693701, ; 50: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 78
	i64 2287834202362508563, ; 51: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 104
	i64 2302323944321350744, ; 52: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2315304989185124968, ; 53: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 122
	i64 2316229908869312383, ; 54: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 55
	i64 2329709569556905518, ; 55: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 81
	i64 2335503487726329082, ; 56: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 164
	i64 2337758774805907496, ; 57: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 145
	i64 2470498323731680442, ; 58: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 74
	i64 2497223385847772520, ; 59: System.Runtime => 0x22a7eb7046413568 => 153
	i64 2547086958574651984, ; 60: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 68
	i64 2602673633151553063, ; 61: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 62: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 56
	i64 2632269733008246987, ; 63: System.Net.NameResolution => 0x2487b36034f808cb => 129
	i64 2656907746661064104, ; 64: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 45
	i64 2662981627730767622, ; 65: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2783046991838674048, ; 66: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 145
	i64 2789714023057451704, ; 67: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 52
	i64 2895129759130297543, ; 68: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 69: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 95
	i64 3110390492489056344, ; 70: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 157
	i64 3289520064315143713, ; 71: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 80
	i64 3311221304742556517, ; 72: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 137
	i64 3325875462027654285, ; 73: System.Runtime.Numerics => 0x2e27e21c8958b48d => 150
	i64 3328853167529574890, ; 74: System.Net.Sockets.dll => 0x2e327651a008c1ea => 135
	i64 3344514922410554693, ; 75: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 98
	i64 3402534845034375023, ; 76: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 67
	i64 3429672777697402584, ; 77: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 60
	i64 3494946837667399002, ; 78: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 43
	i64 3522470458906976663, ; 79: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 92
	i64 3551103847008531295, ; 80: System.Private.CoreLib.dll => 0x31480e226177735f => 175
	i64 3567343442040498961, ; 81: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 82: System.Runtime.dll => 0x319037675df7e556 => 153
	i64 3638003163729360188, ; 83: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 44
	i64 3647754201059316852, ; 84: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 171
	i64 3655542548057982301, ; 85: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 43
	i64 3716579019761409177, ; 86: netstandard.dll => 0x3393f0ed5c8c5c99 => 174
	i64 3727469159507183293, ; 87: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 89
	i64 3869221888984012293, ; 88: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 47
	i64 3890352374528606784, ; 89: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 58
	i64 3919223565570527920, ; 90: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 158
	i64 3933965368022646939, ; 91: System.Net.Requests => 0x369840a8bfadc09b => 132
	i64 3966267475168208030, ; 92: System.Memory => 0x370b03412596249e => 126
	i64 3981462687556418071, ; 93: Auth0.OidcClient.Core => 0x3740ff383a45ba17 => 35
	i64 4009997192427317104, ; 94: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 152
	i64 4073500526318903918, ; 95: System.Private.Xml.dll => 0x3887fb25779ae26e => 141
	i64 4120493066591692148, ; 96: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 97: System.ComponentModel => 0x39a7562737acb67e => 111
	i64 4168469861834746866, ; 98: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 154
	i64 4184189618158325478, ; 99: MongoDB.Driver.dll => 0x3a113a49f7344ee6 => 63
	i64 4187479170553454871, ; 100: System.Linq.Expressions => 0x3a1cea1e912fa117 => 123
	i64 4205801962323029395, ; 101: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 110
	i64 4356591372459378815, ; 102: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4679594760078841447, ; 103: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 104: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 68
	i64 4795410492532947900, ; 105: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 92
	i64 4809057822547766521, ; 106: System.Drawing => 0x42bd349c3145ecf9 => 118
	i64 4814660307502931973, ; 107: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 129
	i64 4853321196694829351, ; 108: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 149
	i64 4926014167703849846, ; 109: MongoDB.Driver => 0x445cb7c950878b76 => 63
	i64 5103417709280584325, ; 110: System.Collections.Specialized => 0x46d2fb5e161b6285 => 107
	i64 5182934613077526976, ; 111: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 107
	i64 5290786973231294105, ; 112: System.Runtime.Loader => 0x496ca6b869b72699 => 149
	i64 5310850843200597321, ; 113: BookNPlay => 0x49b3eeb42c0e2d49 => 100
	i64 5388159308784456503, ; 114: Snappier => 0x4ac69657f94fd337 => 66
	i64 5423376490970181369, ; 115: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 146
	i64 5471532531798518949, ; 116: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 117: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 118: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 120
	i64 5573260873512690141, ; 119: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 161
	i64 5650097808083101034, ; 120: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 155
	i64 5692067934154308417, ; 121: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 94
	i64 5979151488806146654, ; 122: System.Formats.Asn1 => 0x52fa3699a489d25e => 119
	i64 5984759512290286505, ; 123: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 159
	i64 6046211982703393097, ; 124: IdentityModel.OidcClient.dll => 0x53e875c399bef949 => 40
	i64 6068057819846744445, ; 125: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 126: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 127: System.Text.Json.dll => 0x565a67a0ffe264a7 => 165
	i64 6284145129771520194, ; 128: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 142
	i64 6357457916754632952, ; 129: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 130: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 81
	i64 6407094981387243793, ; 131: Auth0.OidcClient.dll => 0x58ea92f077c65111 => 36
	i64 6476067149090213100, ; 132: SharpCompress => 0x59df9cc2ab194cec => 65
	i64 6478287442656530074, ; 133: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 134: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 71
	i64 6548213210057960872, ; 135: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 77
	i64 6560151584539558821, ; 136: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 49
	i64 6617685658146568858, ; 137: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 162
	i64 6743165466166707109, ; 138: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 139: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 140: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 116
	i64 6814185388980153342, ; 141: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 172
	i64 6876862101832370452, ; 142: System.Xml.Linq => 0x5f6f85a57d108914 => 170
	i64 6894844156784520562, ; 143: System.Numerics.Vectors => 0x5faf683aead1ad72 => 137
	i64 7083547580668757502, ; 144: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 140
	i64 7112547816752919026, ; 145: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 122
	i64 7220009545223068405, ; 146: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7243049202045766964, ; 147: MongoDB.Bson.dll => 0x64847adfba9d4d34 => 62
	i64 7270811800166795866, ; 148: System.Linq => 0x64e71ccf51a90a5a => 125
	i64 7316205155833392065, ; 149: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 102
	i64 7377312882064240630, ; 150: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 110
	i64 7488575175965059935, ; 151: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 170
	i64 7489048572193775167, ; 152: System.ObjectModel => 0x67ee71ff6b419e3f => 138
	i64 7496222613193209122, ; 153: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 67
	i64 7592577537120840276, ; 154: System.Diagnostics.Process => 0x695e410af5b2aa54 => 115
	i64 7654504624184590948, ; 155: System.Net.Http => 0x6a3a4366801b8264 => 127
	i64 7694700312542370399, ; 156: System.Net.Mail => 0x6ac9112a7e2cda5f => 128
	i64 7708790323521193081, ; 157: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 158: System.Private.CoreLib => 0x6b0ff375198b9c17 => 175
	i64 7729023323672879921, ; 159: DnsClient.dll => 0x6b4301c3443b2331 => 38
	i64 7735176074855944702, ; 160: Microsoft.CSharp => 0x6b58dda848e391fe => 101
	i64 7735352534559001595, ; 161: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 97
	i64 7836164640616011524, ; 162: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 70
	i64 8031450141206250471, ; 163: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 148
	i64 8064050204834738623, ; 164: System.Collections.dll => 0x6fe942efa61731bf => 108
	i64 8083354569033831015, ; 165: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 80
	i64 8087206902342787202, ; 166: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 114
	i64 8167236081217502503, ; 167: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 176
	i64 8185542183669246576, ; 168: System.Collections => 0x7198e33f4794aa70 => 108
	i64 8246048515196606205, ; 169: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 61
	i64 8264926008854159966, ; 170: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 115
	i64 8308610922448049511, ; 171: MongoDB.Bson => 0x734e1d9cf1725567 => 62
	i64 8368701292315763008, ; 172: System.Security.Cryptography => 0x7423997c6fd56140 => 161
	i64 8400357532724379117, ; 173: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 88
	i64 8410671156615598628, ; 174: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 143
	i64 8518412311883997971, ; 175: System.Collections.Immutable => 0x76377add7c28e313 => 105
	i64 8559880951336221755, ; 176: JWT => 0x76cace5f80073c3b => 41
	i64 8563666267364444763, ; 177: System.Private.Uri => 0x76d841191140ca5b => 139
	i64 8614108721271900878, ; 178: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 179: Java.Interop => 0x77b654e585b55834 => 176
	i64 8638972117149407195, ; 180: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 101
	i64 8639588376636138208, ; 181: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 87
	i64 8648495978913578441, ; 182: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 103
	i64 8677882282824630478, ; 183: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 184: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 114
	i64 8941376889969657626, ; 185: System.Xml.XDocument => 0x7c1626e87187471a => 172
	i64 9045785047181495996, ; 186: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9052662452269567435, ; 187: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 54
	i64 9138683372487561558, ; 188: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 157
	i64 9312692141327339315, ; 189: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 94
	i64 9324707631942237306, ; 190: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 69
	i64 9427266486299436557, ; 191: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 53
	i64 9575902398040817096, ; 192: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 96
	i64 9659729154652888475, ; 193: System.Text.RegularExpressions => 0x860e407c9991dd9b => 166
	i64 9678050649315576968, ; 194: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 74
	i64 9698755676118397142, ; 195: Auth0.OidcClient => 0x8698e6e6b65730d6 => 36
	i64 9702891218465930390, ; 196: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 106
	i64 9808709177481450983, ; 197: Mono.Android.dll => 0x881f890734e555e7 => 178
	i64 9819168441846169364, ; 198: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 54
	i64 9933555792566666578, ; 199: System.Linq.Queryable.dll => 0x89db145cf475c552 => 124
	i64 9956195530459977388, ; 200: Microsoft.Maui => 0x8a2b8315b36616ac => 59
	i64 9991543690424095600, ; 201: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 202: System.Net.Http.dll => 0x8b50e941206af13b => 127
	i64 10051358222726253779, ; 203: System.Private.Xml => 0x8b7d990c97ccccd3 => 141
	i64 10092835686693276772, ; 204: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 57
	i64 10143853363526200146, ; 205: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10155087777681872798, ; 206: JWT.dll => 0x8cee1e87a3a3979e => 41
	i64 10229024438826829339, ; 207: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 77
	i64 10236703004850800690, ; 208: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 134
	i64 10245369515835430794, ; 209: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 143
	i64 10364469296367737616, ; 210: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 142
	i64 10406448008575299332, ; 211: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 98
	i64 10430153318873392755, ; 212: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 75
	i64 10447083246144586668, ; 213: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 42
	i64 10506226065143327199, ; 214: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10634102643060048396, ; 215: IdentityModel => 0x9393ec0310a3020c => 39
	i64 10670374202010151210, ; 216: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 102
	i64 10785150219063592792, ; 217: System.Net.Primitives => 0x95ac8cfb68830758 => 131
	i64 10822644899632537592, ; 218: System.Linq.Queryable => 0x9631c23204ca5ff8 => 124
	i64 11002576679268595294, ; 219: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 48
	i64 11009005086950030778, ; 220: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 59
	i64 11103970607964515343, ; 221: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 222: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 93
	i64 11220793807500858938, ; 223: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 224: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 49
	i64 11244247448620239658, ; 225: DnsClient => 0x9c0b977add9a0b2a => 38
	i64 11340910727871153756, ; 226: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 76
	i64 11380782361707310188, ; 227: IdentityModel.OidcClient => 0x9df0a9428f986c6c => 40
	i64 11485890710487134646, ; 228: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 147
	i64 11517440453979132662, ; 229: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 51
	i64 11518296021396496455, ; 230: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 231: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 93
	i64 11530571088791430846, ; 232: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 47
	i64 11597940890313164233, ; 233: netstandard => 0xa0f429ca8d1805c9 => 174
	i64 11705530742807338875, ; 234: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12040886584167504988, ; 235: System.Net.ServicePoint => 0xa719d28d8e121c5c => 134
	i64 12145679461940342714, ; 236: System.Text.Json => 0xa88e1f1ebcb62fba => 165
	i64 12198439281774268251, ; 237: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 55
	i64 12201331334810686224, ; 238: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 152
	i64 12269460666702402136, ; 239: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 105
	i64 12439275739440478309, ; 240: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 52
	i64 12451044538927396471, ; 241: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 79
	i64 12466513435562512481, ; 242: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 84
	i64 12475113361194491050, ; 243: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 244: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 116
	i64 12538491095302438457, ; 245: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 72
	i64 12550732019250633519, ; 246: System.IO.Compression => 0xae2d28465e8e1b2f => 121
	i64 12681088699309157496, ; 247: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 248: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 73
	i64 12708922737231849740, ; 249: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 163
	i64 12823819093633476069, ; 250: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 251: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 50
	i64 12859557719246324186, ; 252: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 136
	i64 13068258254871114833, ; 253: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 151
	i64 13221551921002590604, ; 254: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 255: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 256: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 177
	i64 13381594904270902445, ; 257: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 258: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 97
	i64 13467053111158216594, ; 259: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 260: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 261: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 262: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 89
	i64 13717397318615465333, ; 263: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 109
	i64 13755568601956062840, ; 264: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 265: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 266: System.Console.dll => 0xc0a5f3cade5c6774 => 112
	i64 13959074834287824816, ; 267: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 79
	i64 14100563506285742564, ; 268: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 269: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 72
	i64 14125464355221830302, ; 270: System.Threading.dll => 0xc407bafdbc707a9e => 169
	i64 14212104595480609394, ; 271: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 156
	i64 14254574811015963973, ; 272: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 163
	i64 14327709162229390963, ; 273: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 160
	i64 14461014870687870182, ; 274: System.Net.Requests.dll => 0xc8afd8683afdece6 => 132
	i64 14464374589798375073, ; 275: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 276: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 277: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 164
	i64 14561513370130550166, ; 278: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 159
	i64 14622043554576106986, ; 279: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 151
	i64 14669215534098758659, ; 280: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 45
	i64 14705122255218365489, ; 281: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 282: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14819054087695749454, ; 283: SharpCompress.dll => 0xcda7db2d9467d14e => 65
	i64 14832630590065248058, ; 284: System.Security.Claims => 0xcdd816ef5d6e873a => 154
	i64 14852515768018889994, ; 285: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 76
	i64 14892012299694389861, ; 286: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 287: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14935719434541007538, ; 288: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 162
	i64 14954917835170835695, ; 289: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 46
	i64 14984936317414011727, ; 290: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 136
	i64 14987728460634540364, ; 291: System.IO.Compression.dll => 0xcfff1ba06622494c => 121
	i64 15015154896917945444, ; 292: System.Net.Security.dll => 0xd0608bd33642dc64 => 133
	i64 15076659072870671916, ; 293: System.ObjectModel.dll => 0xd13b0d8c1620662c => 138
	i64 15111608613780139878, ; 294: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 295: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 120
	i64 15133485256822086103, ; 296: System.Linq.dll => 0xd204f0a9127dd9d7 => 125
	i64 15138356091203993725, ; 297: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 51
	i64 15227001540531775957, ; 298: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 44
	i64 15294490580907848062, ; 299: BookNPlay.dll => 0xd440f2264f91f17e => 100
	i64 15370334346939861994, ; 300: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 75
	i64 15391712275433856905, ; 301: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 46
	i64 15527772828719725935, ; 302: System.Console => 0xd77dbb1e38cd3d6f => 112
	i64 15536481058354060254, ; 303: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 304: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 160
	i64 15557562860424774966, ; 305: System.Net.Sockets => 0xd7e790fe7a6dc536 => 135
	i64 15582737692548360875, ; 306: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 83
	i64 15609085926864131306, ; 307: System.dll => 0xd89e9cf3334914ea => 173
	i64 15661133872274321916, ; 308: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 171
	i64 15664356999916475676, ; 309: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15710114879900314733, ; 310: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 103
	i64 15743187114543869802, ; 311: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 312: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15847085070278954535, ; 313: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 167
	i64 15937190497610202713, ; 314: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 156
	i64 16018552496348375205, ; 315: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 130
	i64 16154507427712707110, ; 316: System => 0xe03056ea4e39aa26 => 173
	i64 16219561732052121626, ; 317: System.Net.Security => 0xe1177575db7c781a => 133
	i64 16288847719894691167, ; 318: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 319: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 48
	i64 16442365378858692411, ; 320: Snappier.dll => 0xe42f04325a0daf3b => 66
	i64 16454459195343277943, ; 321: System.Net.NetworkInformation => 0xe459fb756d988f77 => 130
	i64 16648892297579399389, ; 322: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 323: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 61
	i64 16677317093839702854, ; 324: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 88
	i64 16737807731308835127, ; 325: System.Runtime.Intrinsics => 0xe848a3736f733137 => 148
	i64 16856067890322379635, ; 326: System.Data.Common.dll => 0xe9ecc87060889373 => 113
	i64 16890310621557459193, ; 327: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 166
	i64 16942731696432749159, ; 328: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 329: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 86
	i64 17008137082415910100, ; 330: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 106
	i64 17031351772568316411, ; 331: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 85
	i64 17062143951396181894, ; 332: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 109
	i64 17089008752050867324, ; 333: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 334: System.Threading.Channels => 0xed8ff6060fc420b2 => 167
	i64 17137864900836977098, ; 335: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 56
	i64 17202182880784296190, ; 336: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 158
	i64 17230721278011714856, ; 337: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 140
	i64 17260702271250283638, ; 338: System.Data.Common => 0xef8a5543bba6bc76 => 113
	i64 17342750010158924305, ; 339: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17360349973592121190, ; 340: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 96
	i64 17438153253682247751, ; 341: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 342: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 343: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 344: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 345: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 84
	i64 17710060891934109755, ; 346: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 82
	i64 17712670374920797664, ; 347: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 147
	i64 17777860260071588075, ; 348: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 150
	i64 17790600151040787804, ; 349: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 53
	i64 17979120673405951447, ; 350: ZstdSharp => 0xf982aafeb83e5dd7 => 99
	i64 18025913125965088385, ; 351: System.Threading => 0xfa28e87b91334681 => 169
	i64 18099568558057551825, ; 352: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 353: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 85
	i64 18146411883821974900, ; 354: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 119
	i64 18245806341561545090, ; 355: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 104
	i64 18305135509493619199, ; 356: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 87
	i64 18324163916253801303 ; 357: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [358 x i32] [
	i32 50, ; 0
	i32 178, ; 1
	i32 60, ; 2
	i32 123, ; 3
	i32 73, ; 4
	i32 90, ; 5
	i32 35, ; 6
	i32 91, ; 7
	i32 99, ; 8
	i32 7, ; 9
	i32 144, ; 10
	i32 168, ; 11
	i32 111, ; 12
	i32 10, ; 13
	i32 78, ; 14
	i32 39, ; 15
	i32 144, ; 16
	i32 95, ; 17
	i32 18, ; 18
	i32 118, ; 19
	i32 86, ; 20
	i32 131, ; 21
	i32 57, ; 22
	i32 177, ; 23
	i32 168, ; 24
	i32 16, ; 25
	i32 70, ; 26
	i32 83, ; 27
	i32 64, ; 28
	i32 128, ; 29
	i32 126, ; 30
	i32 139, ; 31
	i32 69, ; 32
	i32 146, ; 33
	i32 6, ; 34
	i32 90, ; 35
	i32 42, ; 36
	i32 117, ; 37
	i32 28, ; 38
	i32 91, ; 39
	i32 58, ; 40
	i32 37, ; 41
	i32 28, ; 42
	i32 155, ; 43
	i32 82, ; 44
	i32 2, ; 45
	i32 20, ; 46
	i32 117, ; 47
	i32 64, ; 48
	i32 71, ; 49
	i32 78, ; 50
	i32 104, ; 51
	i32 24, ; 52
	i32 122, ; 53
	i32 55, ; 54
	i32 81, ; 55
	i32 164, ; 56
	i32 145, ; 57
	i32 74, ; 58
	i32 153, ; 59
	i32 68, ; 60
	i32 27, ; 61
	i32 56, ; 62
	i32 129, ; 63
	i32 45, ; 64
	i32 2, ; 65
	i32 145, ; 66
	i32 52, ; 67
	i32 7, ; 68
	i32 95, ; 69
	i32 157, ; 70
	i32 80, ; 71
	i32 137, ; 72
	i32 150, ; 73
	i32 135, ; 74
	i32 98, ; 75
	i32 67, ; 76
	i32 60, ; 77
	i32 43, ; 78
	i32 92, ; 79
	i32 175, ; 80
	i32 22, ; 81
	i32 153, ; 82
	i32 44, ; 83
	i32 171, ; 84
	i32 43, ; 85
	i32 174, ; 86
	i32 89, ; 87
	i32 47, ; 88
	i32 58, ; 89
	i32 158, ; 90
	i32 132, ; 91
	i32 126, ; 92
	i32 35, ; 93
	i32 152, ; 94
	i32 141, ; 95
	i32 33, ; 96
	i32 111, ; 97
	i32 154, ; 98
	i32 63, ; 99
	i32 123, ; 100
	i32 110, ; 101
	i32 30, ; 102
	i32 0, ; 103
	i32 68, ; 104
	i32 92, ; 105
	i32 118, ; 106
	i32 129, ; 107
	i32 149, ; 108
	i32 63, ; 109
	i32 107, ; 110
	i32 107, ; 111
	i32 149, ; 112
	i32 100, ; 113
	i32 66, ; 114
	i32 146, ; 115
	i32 26, ; 116
	i32 29, ; 117
	i32 120, ; 118
	i32 161, ; 119
	i32 155, ; 120
	i32 94, ; 121
	i32 119, ; 122
	i32 159, ; 123
	i32 40, ; 124
	i32 23, ; 125
	i32 23, ; 126
	i32 165, ; 127
	i32 142, ; 128
	i32 34, ; 129
	i32 81, ; 130
	i32 36, ; 131
	i32 65, ; 132
	i32 11, ; 133
	i32 71, ; 134
	i32 77, ; 135
	i32 49, ; 136
	i32 162, ; 137
	i32 19, ; 138
	i32 22, ; 139
	i32 116, ; 140
	i32 172, ; 141
	i32 170, ; 142
	i32 137, ; 143
	i32 140, ; 144
	i32 122, ; 145
	i32 26, ; 146
	i32 62, ; 147
	i32 125, ; 148
	i32 102, ; 149
	i32 110, ; 150
	i32 170, ; 151
	i32 138, ; 152
	i32 67, ; 153
	i32 115, ; 154
	i32 127, ; 155
	i32 128, ; 156
	i32 17, ; 157
	i32 175, ; 158
	i32 38, ; 159
	i32 101, ; 160
	i32 97, ; 161
	i32 70, ; 162
	i32 148, ; 163
	i32 108, ; 164
	i32 80, ; 165
	i32 114, ; 166
	i32 176, ; 167
	i32 108, ; 168
	i32 61, ; 169
	i32 115, ; 170
	i32 62, ; 171
	i32 161, ; 172
	i32 88, ; 173
	i32 143, ; 174
	i32 105, ; 175
	i32 41, ; 176
	i32 139, ; 177
	i32 21, ; 178
	i32 176, ; 179
	i32 101, ; 180
	i32 87, ; 181
	i32 103, ; 182
	i32 21, ; 183
	i32 114, ; 184
	i32 172, ; 185
	i32 31, ; 186
	i32 54, ; 187
	i32 157, ; 188
	i32 94, ; 189
	i32 69, ; 190
	i32 53, ; 191
	i32 96, ; 192
	i32 166, ; 193
	i32 74, ; 194
	i32 36, ; 195
	i32 106, ; 196
	i32 178, ; 197
	i32 54, ; 198
	i32 124, ; 199
	i32 59, ; 200
	i32 6, ; 201
	i32 127, ; 202
	i32 141, ; 203
	i32 57, ; 204
	i32 3, ; 205
	i32 41, ; 206
	i32 77, ; 207
	i32 134, ; 208
	i32 143, ; 209
	i32 142, ; 210
	i32 98, ; 211
	i32 75, ; 212
	i32 42, ; 213
	i32 1, ; 214
	i32 39, ; 215
	i32 102, ; 216
	i32 131, ; 217
	i32 124, ; 218
	i32 48, ; 219
	i32 59, ; 220
	i32 12, ; 221
	i32 93, ; 222
	i32 15, ; 223
	i32 49, ; 224
	i32 38, ; 225
	i32 76, ; 226
	i32 40, ; 227
	i32 147, ; 228
	i32 51, ; 229
	i32 13, ; 230
	i32 93, ; 231
	i32 47, ; 232
	i32 174, ; 233
	i32 9, ; 234
	i32 134, ; 235
	i32 165, ; 236
	i32 55, ; 237
	i32 152, ; 238
	i32 105, ; 239
	i32 52, ; 240
	i32 79, ; 241
	i32 84, ; 242
	i32 34, ; 243
	i32 116, ; 244
	i32 72, ; 245
	i32 121, ; 246
	i32 14, ; 247
	i32 73, ; 248
	i32 163, ; 249
	i32 27, ; 250
	i32 50, ; 251
	i32 136, ; 252
	i32 151, ; 253
	i32 1, ; 254
	i32 15, ; 255
	i32 177, ; 256
	i32 9, ; 257
	i32 97, ; 258
	i32 29, ; 259
	i32 30, ; 260
	i32 13, ; 261
	i32 89, ; 262
	i32 109, ; 263
	i32 8, ; 264
	i32 11, ; 265
	i32 112, ; 266
	i32 79, ; 267
	i32 3, ; 268
	i32 72, ; 269
	i32 169, ; 270
	i32 156, ; 271
	i32 163, ; 272
	i32 160, ; 273
	i32 132, ; 274
	i32 24, ; 275
	i32 5, ; 276
	i32 164, ; 277
	i32 159, ; 278
	i32 151, ; 279
	i32 45, ; 280
	i32 16, ; 281
	i32 32, ; 282
	i32 65, ; 283
	i32 154, ; 284
	i32 76, ; 285
	i32 33, ; 286
	i32 0, ; 287
	i32 162, ; 288
	i32 46, ; 289
	i32 136, ; 290
	i32 121, ; 291
	i32 133, ; 292
	i32 138, ; 293
	i32 17, ; 294
	i32 120, ; 295
	i32 125, ; 296
	i32 51, ; 297
	i32 44, ; 298
	i32 100, ; 299
	i32 75, ; 300
	i32 46, ; 301
	i32 112, ; 302
	i32 4, ; 303
	i32 160, ; 304
	i32 135, ; 305
	i32 83, ; 306
	i32 173, ; 307
	i32 171, ; 308
	i32 4, ; 309
	i32 103, ; 310
	i32 12, ; 311
	i32 5, ; 312
	i32 167, ; 313
	i32 156, ; 314
	i32 130, ; 315
	i32 173, ; 316
	i32 133, ; 317
	i32 18, ; 318
	i32 48, ; 319
	i32 66, ; 320
	i32 130, ; 321
	i32 37, ; 322
	i32 61, ; 323
	i32 88, ; 324
	i32 148, ; 325
	i32 113, ; 326
	i32 166, ; 327
	i32 25, ; 328
	i32 86, ; 329
	i32 106, ; 330
	i32 85, ; 331
	i32 109, ; 332
	i32 32, ; 333
	i32 167, ; 334
	i32 56, ; 335
	i32 158, ; 336
	i32 140, ; 337
	i32 113, ; 338
	i32 10, ; 339
	i32 96, ; 340
	i32 25, ; 341
	i32 8, ; 342
	i32 20, ; 343
	i32 31, ; 344
	i32 84, ; 345
	i32 82, ; 346
	i32 147, ; 347
	i32 150, ; 348
	i32 53, ; 349
	i32 99, ; 350
	i32 169, ; 351
	i32 19, ; 352
	i32 85, ; 353
	i32 119, ; 354
	i32 104, ; 355
	i32 87, ; 356
	i32 14 ; 357
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
