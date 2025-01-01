; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [179 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [358 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 130
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 129
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 148
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 64
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 168
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 6: System.Security.Cryptography.Primitives => 0x410f24b => 159
	i32 72070932, ; 7: Microsoft.Maui.Graphics.dll => 0x44bb714 => 61
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 147
	i32 122350210, ; 9: System.Threading.Channels.dll => 0x74aea82 => 167
	i32 141369813, ; 10: Auth0.OidcClient.dll => 0x86d21d5 => 36
	i32 142721839, ; 11: System.Net.WebHeaderCollection => 0x881c32f => 136
	i32 149972175, ; 12: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 159
	i32 165246403, ; 13: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 73
	i32 182336117, ; 14: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 92
	i32 195452805, ; 15: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 16: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 17: System.ComponentModel => 0xc38ff48 => 111
	i32 209399409, ; 18: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 71
	i32 230752869, ; 19: Microsoft.CSharp.dll => 0xdc10265 => 101
	i32 246610117, ; 20: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 143
	i32 280992041, ; 21: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 22: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 23: Xamarin.AndroidX.Activity.dll => 0x13031348 => 68
	i32 336156722, ; 24: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 25: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 80
	i32 356389973, ; 26: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 375677976, ; 27: System.Net.ServicePoint.dll => 0x16646418 => 134
	i32 379916513, ; 28: System.Threading.Thread.dll => 0x16a510e1 => 168
	i32 385762202, ; 29: System.Memory.dll => 0x16fe439a => 126
	i32 395744057, ; 30: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 31: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 32: System.Collections => 0x1a61054f => 108
	i32 450948140, ; 33: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 79
	i32 451504562, ; 34: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 160
	i32 459347974, ; 35: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 152
	i32 469710990, ; 36: System.dll => 0x1bff388e => 173
	i32 485463106, ; 37: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 51
	i32 498788369, ; 38: System.ObjectModel => 0x1dbae811 => 138
	i32 500358224, ; 39: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 40: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 41: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 50
	i32 530272170, ; 42: System.Linq.Queryable => 0x1f9b4faa => 124
	i32 539058512, ; 43: Microsoft.Extensions.Logging => 0x20216150 => 47
	i32 540030774, ; 44: System.IO.FileSystem.dll => 0x20303736 => 122
	i32 548916678, ; 45: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 42
	i32 554958394, ; 46: JWT.dll => 0x2113fe3a => 41
	i32 577335427, ; 47: System.Security.Cryptography.Cng => 0x22697083 => 156
	i32 592146354, ; 48: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 613668793, ; 49: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 155
	i32 627609679, ; 50: Xamarin.AndroidX.CustomView => 0x2568904f => 77
	i32 627931235, ; 51: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 52: System.Text.Encodings.Web.dll => 0x27787397 => 164
	i32 672442732, ; 53: System.Collections.Concurrent => 0x2814a96c => 104
	i32 683518922, ; 54: System.Net.Security => 0x28bdabca => 133
	i32 688181140, ; 55: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 56: System.Xml.Linq.dll => 0x29293ff5 => 170
	i32 706645707, ; 57: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 58: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 59: System.Runtime.Loader.dll => 0x2b15ed29 => 149
	i32 759454413, ; 60: System.Net.Requests => 0x2d445acd => 132
	i32 775507847, ; 61: System.IO.Compression => 0x2e394f87 => 121
	i32 777317022, ; 62: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 63: Microsoft.Extensions.Options => 0x2f0980eb => 49
	i32 804715423, ; 64: System.Data.Common => 0x2ff6fb9f => 113
	i32 823281589, ; 65: System.Private.Uri.dll => 0x311247b5 => 139
	i32 830298997, ; 66: System.IO.Compression.Brotli => 0x317d5b75 => 120
	i32 888076676, ; 67: IdentityModel.OidcClient.dll => 0x34eef984 => 40
	i32 904024072, ; 68: System.ComponentModel.Primitives.dll => 0x35e25008 => 109
	i32 926902833, ; 69: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 70: Newtonsoft.Json => 0x38f24a24 => 64
	i32 966729478, ; 71: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 96
	i32 967690846, ; 72: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 80
	i32 975874589, ; 73: System.Xml.XDocument => 0x3a2aaa1d => 172
	i32 992768348, ; 74: System.Collections.dll => 0x3b2c715c => 108
	i32 994442037, ; 75: System.IO.FileSystem => 0x3b45fb35 => 122
	i32 1012816738, ; 76: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 90
	i32 1019214401, ; 77: System.Drawing => 0x3cbffa41 => 118
	i32 1028951442, ; 78: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 46
	i32 1029334545, ; 79: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 80: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 69
	i32 1036536393, ; 81: System.Drawing.Primitives.dll => 0x3dc84a49 => 117
	i32 1044663988, ; 82: System.Linq.Expressions.dll => 0x3e444eb4 => 123
	i32 1052210849, ; 83: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 82
	i32 1064882580, ; 84: Auth0.OidcClient => 0x3f78d194 => 36
	i32 1082857460, ; 85: System.ComponentModel.TypeConverter => 0x408b17f4 => 110
	i32 1084122840, ; 86: Xamarin.Kotlin.StdLib => 0x409e66d8 => 97
	i32 1098259244, ; 87: System => 0x41761b2c => 173
	i32 1111289522, ; 88: DnsClient.dll => 0x423ceeb2 => 38
	i32 1118262833, ; 89: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 90: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 91: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 87
	i32 1203215381, ; 92: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 93: System.Diagnostics.Process => 0x480a69ad => 115
	i32 1214827643, ; 94: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1226106090, ; 95: BookNPlay => 0x4914e4ea => 100
	i32 1234928153, ; 96: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1253011324, ; 97: Microsoft.Win32.Registry => 0x4aaf6f7c => 103
	i32 1260983243, ; 98: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 99: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 78
	i32 1303510003, ; 100: Auth0.OidcClient.Core => 0x4db1fbf3 => 35
	i32 1324164729, ; 101: System.Linq => 0x4eed2679 => 125
	i32 1373134921, ; 102: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 103: Xamarin.AndroidX.SavedState => 0x52114ed3 => 90
	i32 1391893274, ; 104: MongoDB.Bson.dll => 0x52f69b1a => 62
	i32 1406073936, ; 105: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 74
	i32 1408764838, ; 106: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 151
	i32 1411638395, ; 107: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 145
	i32 1430672901, ; 108: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 109: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 96
	i32 1452070440, ; 110: System.Formats.Asn1.dll => 0x568cd628 => 119
	i32 1458022317, ; 111: System.Net.Security.dll => 0x56e7a7ad => 133
	i32 1460893475, ; 112: System.IdentityModel.Tokens.Jwt => 0x57137723 => 67
	i32 1461004990, ; 113: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 114: System.Collections.Immutable.dll => 0x5718a9ef => 105
	i32 1462112819, ; 115: System.IO.Compression.dll => 0x57261233 => 121
	i32 1469204771, ; 116: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 70
	i32 1470490898, ; 117: Microsoft.Extensions.Primitives => 0x57a5e912 => 50
	i32 1479771757, ; 118: System.Collections.Immutable => 0x5833866d => 105
	i32 1480492111, ; 119: System.IO.Compression.Brotli.dll => 0x583e844f => 120
	i32 1487239319, ; 120: Microsoft.Win32.Primitives => 0x58a57897 => 102
	i32 1493001747, ; 121: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 122: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 52
	i32 1514721132, ; 123: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 124: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 166
	i32 1551623176, ; 125: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 126: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 84
	i32 1624863272, ; 127: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 94
	i32 1628113371, ; 128: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 55
	i32 1636350590, ; 129: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 76
	i32 1639515021, ; 130: System.Net.Http.dll => 0x61b9038d => 127
	i32 1639986890, ; 131: System.Text.RegularExpressions => 0x61c036ca => 166
	i32 1657153582, ; 132: System.Runtime => 0x62c6282e => 153
	i32 1658251792, ; 133: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 95
	i32 1677501392, ; 134: System.Net.Primitives.dll => 0x63fca3d0 => 131
	i32 1679769178, ; 135: System.Security.Cryptography => 0x641f3e5a => 161
	i32 1696967625, ; 136: System.Security.Cryptography.Csp => 0x6525abc9 => 157
	i32 1729485958, ; 137: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 72
	i32 1736233607, ; 138: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 139: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1750313021, ; 140: Microsoft.Win32.Primitives.dll => 0x6853a83d => 102
	i32 1763938596, ; 141: System.Diagnostics.TraceSource.dll => 0x69239124 => 116
	i32 1766324549, ; 142: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 92
	i32 1770582343, ; 143: Microsoft.Extensions.Logging.dll => 0x6988f147 => 47
	i32 1780572499, ; 144: Mono.Android.Runtime.dll => 0x6a216153 => 177
	i32 1782862114, ; 145: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 146: Xamarin.AndroidX.Fragment => 0x6a96652d => 79
	i32 1793755602, ; 147: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1796167890, ; 148: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 42
	i32 1807397336, ; 149: MongoDB.Driver => 0x6bbab1d8 => 63
	i32 1808609942, ; 150: Xamarin.AndroidX.Loader => 0x6bcd3296 => 84
	i32 1813058853, ; 151: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 97
	i32 1813201214, ; 152: Xamarin.Google.Android.Material => 0x6c13413e => 95
	i32 1818569960, ; 153: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 88
	i32 1824175904, ; 154: System.Text.Encoding.Extensions => 0x6cbab720 => 163
	i32 1824722060, ; 155: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 151
	i32 1828688058, ; 156: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 48
	i32 1835989518, ; 157: Snappier => 0x6d6efa0e => 66
	i32 1842015223, ; 158: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1851731066, ; 159: BookNPlay.dll => 0x6e5f2c7a => 100
	i32 1853025655, ; 160: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 161: System.Linq.Expressions => 0x6ec71a65 => 123
	i32 1870277092, ; 162: System.Reflection.Primitives => 0x6f7a29e4 => 144
	i32 1871986876, ; 163: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 55
	i32 1875480394, ; 164: IdentityModel => 0x6fc98f4a => 39
	i32 1875935024, ; 165: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 166: System.Collections.NonGeneric.dll => 0x71dc7c8b => 106
	i32 1939592360, ; 167: System.Private.Xml.Linq => 0x739bd4a8 => 140
	i32 1961813231, ; 168: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 91
	i32 1968388702, ; 169: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 43
	i32 1986222447, ; 170: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 56
	i32 2003115576, ; 171: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 172: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 82
	i32 2025202353, ; 173: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 174: System.Private.Xml => 0x79eb68ee => 141
	i32 2055257422, ; 175: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 81
	i32 2066184531, ; 176: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 177: System.Diagnostics.TraceSource => 0x7b6f419e => 116
	i32 2079903147, ; 178: System.Runtime.dll => 0x7bf8cdab => 153
	i32 2090596640, ; 179: System.Numerics.Vectors => 0x7c9bf920 => 137
	i32 2127167465, ; 180: System.Console => 0x7ec9ffe9 => 112
	i32 2142473426, ; 181: System.Collections.Specialized => 0x7fb38cd2 => 107
	i32 2159891885, ; 182: Microsoft.Maui => 0x80bd55ad => 59
	i32 2169148018, ; 183: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 184: Microsoft.Extensions.Options.dll => 0x820d22b3 => 49
	i32 2192057212, ; 185: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 48
	i32 2193016926, ; 186: System.ObjectModel.dll => 0x82b6c85e => 138
	i32 2201107256, ; 187: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 98
	i32 2201231467, ; 188: System.Net.Http => 0x8334206b => 127
	i32 2207618523, ; 189: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2253551641, ; 190: Microsoft.IdentityModel.Protocols => 0x86527819 => 54
	i32 2266799131, ; 191: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 44
	i32 2270573516, ; 192: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 193: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 89
	i32 2290594010, ; 194: SharpCompress.dll => 0x8887b0da => 65
	i32 2295906218, ; 195: System.Net.Sockets => 0x88d8bfaa => 135
	i32 2298471582, ; 196: System.Net.Mail => 0x88ffe49e => 128
	i32 2303942373, ; 197: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 198: System.Private.CoreLib.dll => 0x896b7878 => 175
	i32 2340441535, ; 199: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 146
	i32 2353062107, ; 200: System.Net.Primitives => 0x8c40e0db => 131
	i32 2368005991, ; 201: System.Xml.ReaderWriter.dll => 0x8d24e767 => 171
	i32 2369706906, ; 202: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 53
	i32 2371007202, ; 203: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 43
	i32 2378619854, ; 204: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 157
	i32 2395872292, ; 205: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 206: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 207: System.Console.dll => 0x912896e5 => 112
	i32 2458678730, ; 208: System.Net.Sockets.dll => 0x928c75ca => 135
	i32 2471841756, ; 209: netstandard.dll => 0x93554fdc => 174
	i32 2475788418, ; 210: Java.Interop.dll => 0x93918882 => 176
	i32 2480646305, ; 211: Microsoft.Maui.Controls => 0x93dba8a1 => 57
	i32 2484371297, ; 212: System.Net.ServicePoint => 0x94147f61 => 134
	i32 2502290808, ; 213: JWT => 0x9525ed78 => 41
	i32 2538310050, ; 214: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 143
	i32 2550873716, ; 215: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 216: Microsoft.CSharp => 0x98ba5a04 => 101
	i32 2570120770, ; 217: System.Text.Encodings.Web => 0x9930ee42 => 164
	i32 2585220780, ; 218: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 163
	i32 2593496499, ; 219: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 220: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 98
	i32 2611359322, ; 221: ZstdSharp.dll => 0x9ba62e5a => 99
	i32 2617129537, ; 222: System.Private.Xml.dll => 0x9bfe3a41 => 141
	i32 2620871830, ; 223: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 76
	i32 2626831493, ; 224: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2640290731, ; 225: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 53
	i32 2663698177, ; 226: System.Runtime.Loader => 0x9ec4cf01 => 149
	i32 2664396074, ; 227: System.Xml.XDocument.dll => 0x9ecf752a => 172
	i32 2665622720, ; 228: System.Drawing.Primitives => 0x9ee22cc0 => 117
	i32 2676780864, ; 229: System.Data.Common.dll => 0x9f8c6f40 => 113
	i32 2717744543, ; 230: System.Security.Claims => 0xa1fd7d9f => 154
	i32 2719963679, ; 231: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 156
	i32 2724373263, ; 232: System.Runtime.Numerics.dll => 0xa262a30f => 150
	i32 2725980451, ; 233: SharpCompress => 0xa27b2923 => 65
	i32 2732626843, ; 234: Xamarin.AndroidX.Activity => 0xa2e0939b => 68
	i32 2735172069, ; 235: System.Threading.Channels => 0xa30769e5 => 167
	i32 2737747696, ; 236: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 70
	i32 2752995522, ; 237: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 238: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 58
	i32 2764765095, ; 239: Microsoft.Maui.dll => 0xa4caf7a7 => 59
	i32 2765824710, ; 240: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 162
	i32 2778768386, ; 241: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 93
	i32 2785988530, ; 242: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 243: Microsoft.Maui.Graphics => 0xa7008e0b => 61
	i32 2806116107, ; 244: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 245: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 74
	i32 2811698451, ; 246: Auth0.OidcClient.Core.dll => 0xa7971d13 => 35
	i32 2831556043, ; 247: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 248: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 93
	i32 2861189240, ; 249: Microsoft.Maui.Essentials => 0xaa8a4878 => 60
	i32 2909740682, ; 250: System.Private.CoreLib => 0xad6f1e8a => 175
	i32 2916838712, ; 251: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 94
	i32 2919462931, ; 252: System.Numerics.Vectors.dll => 0xae037813 => 137
	i32 2959614098, ; 253: System.ComponentModel.dll => 0xb0682092 => 111
	i32 2972252294, ; 254: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 155
	i32 2978675010, ; 255: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 78
	i32 2987532451, ; 256: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 91
	i32 3038032645, ; 257: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 258: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 85
	i32 3059408633, ; 259: Mono.Android.Runtime => 0xb65adef9 => 177
	i32 3059793426, ; 260: System.ComponentModel.Primitives => 0xb660be12 => 109
	i32 3077302341, ; 261: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 262: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 56
	i32 3089219899, ; 263: ZstdSharp => 0xb821c13b => 99
	i32 3090735792, ; 264: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 160
	i32 3099732863, ; 265: System.Security.Claims.dll => 0xb8c22b7f => 154
	i32 3103600923, ; 266: System.Formats.Asn1 => 0xb8fd311b => 119
	i32 3159123045, ; 267: System.Reflection.Primitives.dll => 0xbc4c6465 => 144
	i32 3173064269, ; 268: DnsClient => 0xbd211e4d => 38
	i32 3178803400, ; 269: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 86
	i32 3220365878, ; 270: System.Threading => 0xbff2e236 => 169
	i32 3252856589, ; 271: MongoDB.Driver.dll => 0xc1e2a70d => 63
	i32 3258312781, ; 272: Xamarin.AndroidX.CardView => 0xc235e84d => 72
	i32 3258876633, ; 273: MongoDB.Bson => 0xc23e82d9 => 62
	i32 3265493905, ; 274: System.Linq.Queryable.dll => 0xc2a37b91 => 124
	i32 3279906254, ; 275: Microsoft.Win32.Registry.dll => 0xc37f65ce => 103
	i32 3290767353, ; 276: System.Security.Cryptography.Encoding => 0xc4251ff9 => 158
	i32 3305363605, ; 277: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 278: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 52
	i32 3316684772, ; 279: System.Net.Requests.dll => 0xc5b097e4 => 132
	i32 3317135071, ; 280: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 77
	i32 3346324047, ; 281: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 87
	i32 3357674450, ; 282: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 283: System.Text.Json => 0xc82afec1 => 165
	i32 3362522851, ; 284: Xamarin.AndroidX.Core => 0xc86c06e3 => 75
	i32 3366347497, ; 285: Java.Interop => 0xc8a662e9 => 176
	i32 3374879918, ; 286: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 54
	i32 3374999561, ; 287: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 89
	i32 3381016424, ; 288: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 289: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 145
	i32 3428513518, ; 290: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 45
	i32 3430777524, ; 291: netstandard => 0xcc7d82b4 => 174
	i32 3463511458, ; 292: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 293: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 110
	i32 3476120550, ; 294: Mono.Android => 0xcf3163e6 => 178
	i32 3479583265, ; 295: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 296: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 297: System.Text.Json.dll => 0xcfbaacae => 165
	i32 3509114376, ; 298: System.Xml.Linq => 0xd128d608 => 170
	i32 3580758918, ; 299: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 300: System.Linq.dll => 0xd715a361 => 125
	i32 3624195450, ; 301: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 146
	i32 3641597786, ; 302: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 81
	i32 3643446276, ; 303: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 304: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 86
	i32 3657292374, ; 305: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 44
	i32 3660523487, ; 306: System.Net.NetworkInformation => 0xda2f27df => 130
	i32 3672681054, ; 307: Mono.Android.dll => 0xdae8aa5e => 178
	i32 3682565725, ; 308: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 71
	i32 3697841164, ; 309: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 310: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 51
	i32 3716563718, ; 311: System.Runtime.Intrinsics => 0xdd864306 => 148
	i32 3724971120, ; 312: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 85
	i32 3732100267, ; 313: System.Net.NameResolution => 0xde7354ab => 129
	i32 3748608112, ; 314: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 114
	i32 3786282454, ; 315: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 73
	i32 3791210109, ; 316: Snappier.dll => 0xe1f9467d => 66
	i32 3792276235, ; 317: System.Collections.NonGeneric => 0xe2098b0b => 106
	i32 3802395368, ; 318: System.Collections.Specialized.dll => 0xe2a3f2e8 => 107
	i32 3823082795, ; 319: System.Security.Cryptography.dll => 0xe3df9d2b => 161
	i32 3841636137, ; 320: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 46
	i32 3844307129, ; 321: System.Net.Mail.dll => 0xe52378b9 => 128
	i32 3849253459, ; 322: System.Runtime.InteropServices.dll => 0xe56ef253 => 147
	i32 3875112723, ; 323: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 158
	i32 3885497537, ; 324: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 136
	i32 3889960447, ; 325: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 326: System.Collections.Concurrent.dll => 0xe839deed => 104
	i32 3896760992, ; 327: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 75
	i32 3928044579, ; 328: System.Xml.ReaderWriter => 0xea213423 => 171
	i32 3931092270, ; 329: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 88
	i32 3953953790, ; 330: System.Text.Encoding.CodePages => 0xebac8bfe => 162
	i32 3955647286, ; 331: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 69
	i32 3980434154, ; 332: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 333: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 334: System.Diagnostics.Process.dll => 0xee9f991d => 115
	i32 4025784931, ; 335: System.Memory => 0xeff49a63 => 126
	i32 4044257358, ; 336: IdentityModel.dll => 0xf10e784e => 39
	i32 4046471985, ; 337: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 58
	i32 4054681211, ; 338: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 142
	i32 4068434129, ; 339: System.Private.Xml.Linq.dll => 0xf27f60d1 => 140
	i32 4073602200, ; 340: System.Threading.dll => 0xf2ce3c98 => 169
	i32 4094352644, ; 341: Microsoft.Maui.Essentials.dll => 0xf40add04 => 60
	i32 4099507663, ; 342: System.Drawing.dll => 0xf45985cf => 118
	i32 4100113165, ; 343: System.Private.Uri => 0xf462c30d => 139
	i32 4102112229, ; 344: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 345: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 346: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 45
	i32 4147896353, ; 347: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 142
	i32 4150914736, ; 348: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4152369130, ; 349: IdentityModel.OidcClient => 0xf7801fea => 40
	i32 4181436372, ; 350: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 152
	i32 4182413190, ; 351: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 83
	i32 4213026141, ; 352: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 114
	i32 4263231520, ; 353: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 67
	i32 4271975918, ; 354: Microsoft.Maui.Controls.dll => 0xfea12dee => 57
	i32 4274623895, ; 355: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 356: System.Runtime.Numerics => 0xfecef6ea => 150
	i32 4292120959 ; 357: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 83
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [358 x i32] [
	i32 130, ; 0
	i32 129, ; 1
	i32 148, ; 2
	i32 64, ; 3
	i32 168, ; 4
	i32 33, ; 5
	i32 159, ; 6
	i32 61, ; 7
	i32 147, ; 8
	i32 167, ; 9
	i32 36, ; 10
	i32 136, ; 11
	i32 159, ; 12
	i32 73, ; 13
	i32 92, ; 14
	i32 30, ; 15
	i32 31, ; 16
	i32 111, ; 17
	i32 71, ; 18
	i32 101, ; 19
	i32 143, ; 20
	i32 2, ; 21
	i32 30, ; 22
	i32 68, ; 23
	i32 15, ; 24
	i32 80, ; 25
	i32 14, ; 26
	i32 134, ; 27
	i32 168, ; 28
	i32 126, ; 29
	i32 34, ; 30
	i32 26, ; 31
	i32 108, ; 32
	i32 79, ; 33
	i32 160, ; 34
	i32 152, ; 35
	i32 173, ; 36
	i32 51, ; 37
	i32 138, ; 38
	i32 13, ; 39
	i32 7, ; 40
	i32 50, ; 41
	i32 124, ; 42
	i32 47, ; 43
	i32 122, ; 44
	i32 42, ; 45
	i32 41, ; 46
	i32 156, ; 47
	i32 21, ; 48
	i32 155, ; 49
	i32 77, ; 50
	i32 19, ; 51
	i32 164, ; 52
	i32 104, ; 53
	i32 133, ; 54
	i32 1, ; 55
	i32 170, ; 56
	i32 16, ; 57
	i32 4, ; 58
	i32 149, ; 59
	i32 132, ; 60
	i32 121, ; 61
	i32 25, ; 62
	i32 49, ; 63
	i32 113, ; 64
	i32 139, ; 65
	i32 120, ; 66
	i32 40, ; 67
	i32 109, ; 68
	i32 28, ; 69
	i32 64, ; 70
	i32 96, ; 71
	i32 80, ; 72
	i32 172, ; 73
	i32 108, ; 74
	i32 122, ; 75
	i32 90, ; 76
	i32 118, ; 77
	i32 46, ; 78
	i32 3, ; 79
	i32 69, ; 80
	i32 117, ; 81
	i32 123, ; 82
	i32 82, ; 83
	i32 36, ; 84
	i32 110, ; 85
	i32 97, ; 86
	i32 173, ; 87
	i32 38, ; 88
	i32 16, ; 89
	i32 22, ; 90
	i32 87, ; 91
	i32 20, ; 92
	i32 115, ; 93
	i32 37, ; 94
	i32 100, ; 95
	i32 18, ; 96
	i32 103, ; 97
	i32 2, ; 98
	i32 78, ; 99
	i32 35, ; 100
	i32 125, ; 101
	i32 32, ; 102
	i32 90, ; 103
	i32 62, ; 104
	i32 74, ; 105
	i32 151, ; 106
	i32 145, ; 107
	i32 0, ; 108
	i32 96, ; 109
	i32 119, ; 110
	i32 133, ; 111
	i32 67, ; 112
	i32 6, ; 113
	i32 105, ; 114
	i32 121, ; 115
	i32 70, ; 116
	i32 50, ; 117
	i32 105, ; 118
	i32 120, ; 119
	i32 102, ; 120
	i32 10, ; 121
	i32 52, ; 122
	i32 5, ; 123
	i32 166, ; 124
	i32 25, ; 125
	i32 84, ; 126
	i32 94, ; 127
	i32 55, ; 128
	i32 76, ; 129
	i32 127, ; 130
	i32 166, ; 131
	i32 153, ; 132
	i32 95, ; 133
	i32 131, ; 134
	i32 161, ; 135
	i32 157, ; 136
	i32 72, ; 137
	i32 23, ; 138
	i32 1, ; 139
	i32 102, ; 140
	i32 116, ; 141
	i32 92, ; 142
	i32 47, ; 143
	i32 177, ; 144
	i32 17, ; 145
	i32 79, ; 146
	i32 9, ; 147
	i32 42, ; 148
	i32 63, ; 149
	i32 84, ; 150
	i32 97, ; 151
	i32 95, ; 152
	i32 88, ; 153
	i32 163, ; 154
	i32 151, ; 155
	i32 48, ; 156
	i32 66, ; 157
	i32 29, ; 158
	i32 100, ; 159
	i32 26, ; 160
	i32 123, ; 161
	i32 144, ; 162
	i32 55, ; 163
	i32 39, ; 164
	i32 8, ; 165
	i32 106, ; 166
	i32 140, ; 167
	i32 91, ; 168
	i32 43, ; 169
	i32 56, ; 170
	i32 5, ; 171
	i32 82, ; 172
	i32 0, ; 173
	i32 141, ; 174
	i32 81, ; 175
	i32 4, ; 176
	i32 116, ; 177
	i32 153, ; 178
	i32 137, ; 179
	i32 112, ; 180
	i32 107, ; 181
	i32 59, ; 182
	i32 12, ; 183
	i32 49, ; 184
	i32 48, ; 185
	i32 138, ; 186
	i32 98, ; 187
	i32 127, ; 188
	i32 14, ; 189
	i32 54, ; 190
	i32 44, ; 191
	i32 8, ; 192
	i32 89, ; 193
	i32 65, ; 194
	i32 135, ; 195
	i32 128, ; 196
	i32 18, ; 197
	i32 175, ; 198
	i32 146, ; 199
	i32 131, ; 200
	i32 171, ; 201
	i32 53, ; 202
	i32 43, ; 203
	i32 157, ; 204
	i32 13, ; 205
	i32 10, ; 206
	i32 112, ; 207
	i32 135, ; 208
	i32 174, ; 209
	i32 176, ; 210
	i32 57, ; 211
	i32 134, ; 212
	i32 41, ; 213
	i32 143, ; 214
	i32 11, ; 215
	i32 101, ; 216
	i32 164, ; 217
	i32 163, ; 218
	i32 20, ; 219
	i32 98, ; 220
	i32 99, ; 221
	i32 141, ; 222
	i32 76, ; 223
	i32 15, ; 224
	i32 53, ; 225
	i32 149, ; 226
	i32 172, ; 227
	i32 117, ; 228
	i32 113, ; 229
	i32 154, ; 230
	i32 156, ; 231
	i32 150, ; 232
	i32 65, ; 233
	i32 68, ; 234
	i32 167, ; 235
	i32 70, ; 236
	i32 21, ; 237
	i32 58, ; 238
	i32 59, ; 239
	i32 162, ; 240
	i32 93, ; 241
	i32 27, ; 242
	i32 61, ; 243
	i32 6, ; 244
	i32 74, ; 245
	i32 35, ; 246
	i32 19, ; 247
	i32 93, ; 248
	i32 60, ; 249
	i32 175, ; 250
	i32 94, ; 251
	i32 137, ; 252
	i32 111, ; 253
	i32 155, ; 254
	i32 78, ; 255
	i32 91, ; 256
	i32 34, ; 257
	i32 85, ; 258
	i32 177, ; 259
	i32 109, ; 260
	i32 12, ; 261
	i32 56, ; 262
	i32 99, ; 263
	i32 160, ; 264
	i32 154, ; 265
	i32 119, ; 266
	i32 144, ; 267
	i32 38, ; 268
	i32 86, ; 269
	i32 169, ; 270
	i32 63, ; 271
	i32 72, ; 272
	i32 62, ; 273
	i32 124, ; 274
	i32 103, ; 275
	i32 158, ; 276
	i32 7, ; 277
	i32 52, ; 278
	i32 132, ; 279
	i32 77, ; 280
	i32 87, ; 281
	i32 24, ; 282
	i32 165, ; 283
	i32 75, ; 284
	i32 176, ; 285
	i32 54, ; 286
	i32 89, ; 287
	i32 3, ; 288
	i32 145, ; 289
	i32 45, ; 290
	i32 174, ; 291
	i32 11, ; 292
	i32 110, ; 293
	i32 178, ; 294
	i32 24, ; 295
	i32 23, ; 296
	i32 165, ; 297
	i32 170, ; 298
	i32 31, ; 299
	i32 125, ; 300
	i32 146, ; 301
	i32 81, ; 302
	i32 28, ; 303
	i32 86, ; 304
	i32 44, ; 305
	i32 130, ; 306
	i32 178, ; 307
	i32 71, ; 308
	i32 33, ; 309
	i32 51, ; 310
	i32 148, ; 311
	i32 85, ; 312
	i32 129, ; 313
	i32 114, ; 314
	i32 73, ; 315
	i32 66, ; 316
	i32 106, ; 317
	i32 107, ; 318
	i32 161, ; 319
	i32 46, ; 320
	i32 128, ; 321
	i32 147, ; 322
	i32 158, ; 323
	i32 136, ; 324
	i32 32, ; 325
	i32 104, ; 326
	i32 75, ; 327
	i32 171, ; 328
	i32 88, ; 329
	i32 162, ; 330
	i32 69, ; 331
	i32 27, ; 332
	i32 9, ; 333
	i32 115, ; 334
	i32 126, ; 335
	i32 39, ; 336
	i32 58, ; 337
	i32 142, ; 338
	i32 140, ; 339
	i32 169, ; 340
	i32 60, ; 341
	i32 118, ; 342
	i32 139, ; 343
	i32 22, ; 344
	i32 17, ; 345
	i32 45, ; 346
	i32 142, ; 347
	i32 29, ; 348
	i32 40, ; 349
	i32 152, ; 350
	i32 83, ; 351
	i32 114, ; 352
	i32 67, ; 353
	i32 57, ; 354
	i32 37, ; 355
	i32 150, ; 356
	i32 83 ; 357
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
