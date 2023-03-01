; LLVM IR representation of chpl_user_main function after basic optimization stage
; ModuleID = 'root'
source_filename = "root"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%string_chpl = type { i64, i64, i64, i8*, i8, i8, i32 }

@_str_literal_1558_chpl = external dso_local global %string_chpl

declare dso_local void @writeln_chpl(%string_chpl* nonnull dereferenceable(40))

; Function Attrs: noinline
define weak dso_local void @chpl_user_main() #0 !dbg !166 {
  %1 = alloca %string_chpl, align 8, !dbg !189
  %2 = bitcast %string_chpl* %1 to i8*, !dbg !189
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %2), !dbg !189
  call void @llvm.dbg.declare(metadata %string_chpl* %1, metadata !171, metadata !DIExpression()), !dbg !190
  br label %3, !dbg !189

3:                                                ; preds = %0
  %4 = load %string_chpl, %string_chpl* @_str_literal_1558_chpl, align 8, !dbg !190
  store %string_chpl %4, %string_chpl* %1, align 8, !dbg !190
  %5 = bitcast %string_chpl* %1 to i8*, !dbg !190
  %6 = call {}* @llvm.invariant.start.p0i8(i64 40, i8* %5), !dbg !190
  call void @writeln_chpl(%string_chpl* nonnull dereferenceable(40) %1), !dbg !190
  %7 = bitcast %string_chpl* %1 to i8*, !dbg !189
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %7), !dbg !189
  ret void, !dbg !189
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare {}* @llvm.invariant.start.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { noinline }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.dbg.cu = !{!11, !163}
!llvm.ident = !{!165}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 3]}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 1, !"branch-target-enforcement", i32 0}
!5 = !{i32 1, !"sign-return-address", i32 0}
!6 = !{i32 1, !"sign-return-address-all", i32 0}
!7 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 1}
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !12, producer: "clang version 14.0.0 (git@github.com:jabraham17/chapel.git 5c733d50ff2929d25ec540d12164291318dab871)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, retainedTypes: !85, globals: !162, splitDebugInlining: false, nameTableKind: None, sysroot: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk", sdk: "MacOSX.sdk")
!12 = !DIFile(filename: "/Users/jade/Development/chapel/runtime/etc/rtmain.c", directory: "/Users/jade/Development/learn-chapel/simple")
!13 = !{!14, !65, !74, !78}
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 107, baseType: !16, size: 32, elements: !17)
!15 = !DIFile(filename: "chapel/runtime/include/chpl-mem-desc.h", directory: "/Users/jade/Development")
!16 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64}
!18 = !DIEnumerator(name: "CHPL_RT_MD_UNKNOWN", value: 0)
!19 = !DIEnumerator(name: "CHPL_RT_MD_EXECUTION_COMMAND", value: 1)
!20 = !DIEnumerator(name: "CHPL_RT_MD_ARRAY_ELEMENTS", value: 2)
!21 = !DIEnumerator(name: "CHPL_RT_MD_SET_WIDE_STRING", value: 3)
!22 = !DIEnumerator(name: "CHPL_RT_MD_GET_WIDE_STRING", value: 4)
!23 = !DIEnumerator(name: "CHPL_RT_MD_COMMAND_BUFFER", value: 5)
!24 = !DIEnumerator(name: "CHPL_RT_MD_COMM_UTIL", value: 6)
!25 = !DIEnumerator(name: "CHPL_RT_MD_COMM_XMIT_RCV_BUF", value: 7)
!26 = !DIEnumerator(name: "CHPL_RT_MD_COMM_FRK_SND_INFO", value: 8)
!27 = !DIEnumerator(name: "CHPL_RT_MD_COMM_FRK_SND_ARG", value: 9)
!28 = !DIEnumerator(name: "CHPL_RT_MD_COMM_FRK_RCV_INFO", value: 10)
!29 = !DIEnumerator(name: "CHPL_RT_MD_COMM_FRK_RCV_ARG", value: 11)
!30 = !DIEnumerator(name: "CHPL_RT_MD_COMM_FRK_DONE_FLAG", value: 12)
!31 = !DIEnumerator(name: "CHPL_RT_MD_COMM_PER_LOC_INFO", value: 13)
!32 = !DIEnumerator(name: "CHPL_RT_MD_COMM_PRV_OBJ_ARRAY", value: 14)
!33 = !DIEnumerator(name: "CHPL_RT_MD_COMM_PRV_BCAST_DATA", value: 15)
!34 = !DIEnumerator(name: "CHPL_RT_MD_MEM_HEAP_SPACE", value: 16)
!35 = !DIEnumerator(name: "CHPL_RT_MD_GLOM_STRINGS_DATA", value: 17)
!36 = !DIEnumerator(name: "CHPL_RT_MD_STRING_LITERALS_BUF", value: 18)
!37 = !DIEnumerator(name: "CHPL_RT_MD_STR_COPY_DATA", value: 19)
!38 = !DIEnumerator(name: "CHPL_RT_MD_STR_COPY_REMOTE", value: 20)
!39 = !DIEnumerator(name: "CHPL_RT_MD_STR_CONCAT_DATA", value: 21)
!40 = !DIEnumerator(name: "CHPL_RT_MD_STR_MOVE_DATA", value: 22)
!41 = !DIEnumerator(name: "CHPL_RT_MD_STR_SELECT_DATA", value: 23)
!42 = !DIEnumerator(name: "CHPL_RT_MD_CFG_ARG_COPY_DATA", value: 24)
!43 = !DIEnumerator(name: "CHPL_RT_MD_CF_TABLE_DATA", value: 25)
!44 = !DIEnumerator(name: "CHPL_RT_MD_LOCALE_NAME_BUF", value: 26)
!45 = !DIEnumerator(name: "CHPL_RT_MD_TASK_DESC", value: 27)
!46 = !DIEnumerator(name: "CHPL_RT_MD_TASK_DESC_LINK", value: 28)
!47 = !DIEnumerator(name: "CHPL_RT_MD_TASK_ARG", value: 29)
!48 = !DIEnumerator(name: "CHPL_RT_MD_TASK_STACK", value: 30)
!49 = !DIEnumerator(name: "CHPL_RT_MD_MUTEX", value: 31)
!50 = !DIEnumerator(name: "CHPL_RT_MD_LOCK_REPORT_DATA", value: 32)
!51 = !DIEnumerator(name: "CHPL_RT_MD_TASK_POOL_DESC", value: 33)
!52 = !DIEnumerator(name: "CHPL_RT_MD_TASK_ARG_AND_POOL_DESC", value: 34)
!53 = !DIEnumerator(name: "CHPL_RT_MD_TASK_LAYER_UNSPEC", value: 35)
!54 = !DIEnumerator(name: "CHPL_RT_MD_THREAD_PRV_DATA", value: 36)
!55 = !DIEnumerator(name: "CHPL_RT_MD_THREAD_LIST_DESC", value: 37)
!56 = !DIEnumerator(name: "CHPL_RT_MD_THREAD_STACK_DESC", value: 38)
!57 = !DIEnumerator(name: "CHPL_RT_MD_IO_BUFFER", value: 39)
!58 = !DIEnumerator(name: "CHPL_RT_MD_OS_LAYER_TMP_DATA", value: 40)
!59 = !DIEnumerator(name: "CHPL_RT_MD_GMP", value: 41)
!60 = !DIEnumerator(name: "CHPL_RT_MD_GETS_PUTS_STRIDES", value: 42)
!61 = !DIEnumerator(name: "CHPL_RT_MD_MLI_DATA", value: 43)
!62 = !DIEnumerator(name: "CHPL_RT_MD_GPU_DATA", value: 44)
!63 = !DIEnumerator(name: "CHPL_RT_MD_GPU_KERNEL_ARG", value: 45)
!64 = !DIEnumerator(name: "CHPL_RT_MD_NUM", value: 46)
!65 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "memory_order", file: !66, line: 51, baseType: !16, size: 32, elements: !67)
!66 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/include/stdatomic.h", directory: "")
!67 = !{!68, !69, !70, !71, !72, !73}
!68 = !DIEnumerator(name: "memory_order_relaxed", value: 0)
!69 = !DIEnumerator(name: "memory_order_consume", value: 1)
!70 = !DIEnumerator(name: "memory_order_acquire", value: 2)
!71 = !DIEnumerator(name: "memory_order_release", value: 3)
!72 = !DIEnumerator(name: "memory_order_acq_rel", value: 4)
!73 = !DIEnumerator(name: "memory_order_seq_cst", value: 5)
!74 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !75, line: 79, baseType: !16, size: 32, elements: !76)
!75 = !DIFile(filename: "chapel/runtime/include/qio/qio_error.h", directory: "/Users/jade/Development")
!76 = !{!77}
!77 = !DIEnumerator(name: "EXTEND_ERROR_OFFSET", value: 1000)
!78 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !79, line: 51, baseType: !16, size: 32, elements: !80)
!79 = !DIFile(filename: "chapel/runtime/include/qio/qio.h", directory: "/Users/jade/Development")
!80 = !{!81, !82, !83, !84}
!81 = !DIEnumerator(name: "QIO_FDFLAG_UNK", value: 1)
!82 = !DIEnumerator(name: "QIO_FDFLAG_READABLE", value: 2)
!83 = !DIEnumerator(name: "QIO_FDFLAG_WRITEABLE", value: 4)
!84 = !DIEnumerator(name: "QIO_FDFLAG_SEEKABLE", value: 8)
!85 = !{!86, !87, !90, !89, !95, !96, !98, !101, !160}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !89)
!89 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !91, line: 32, baseType: !92)
!91 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types/_intptr_t.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !93, line: 27, baseType: !94)
!93 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm/_types.h", directory: "")
!94 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !99, line: 30, baseType: !100)
!99 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types/_int32_t.h", directory: "")
!100 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "_cfile", file: !102, line: 46, baseType: !103)
!102 = !DIFile(filename: "chapel/runtime/include/chplio.h", directory: "/Users/jade/Development")
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !105, line: 157, baseType: !106)
!105 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_stdio.h", directory: "")
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !105, line: 126, size: 1216, elements: !107)
!107 = !{!108, !109, !110, !111, !113, !114, !119, !120, !121, !125, !129, !138, !144, !145, !148, !149, !153, !157, !158, !159}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !106, file: !105, line: 127, baseType: !95, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !106, file: !105, line: 128, baseType: !100, size: 32, offset: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !106, file: !105, line: 129, baseType: !100, size: 32, offset: 96)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !106, file: !105, line: 130, baseType: !112, size: 16, offset: 128)
!112 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !106, file: !105, line: 131, baseType: !112, size: 16, offset: 144)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !106, file: !105, line: 132, baseType: !115, size: 128, offset: 192)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !105, line: 92, size: 128, elements: !116)
!116 = !{!117, !118}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !115, file: !105, line: 93, baseType: !95, size: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !115, file: !105, line: 94, baseType: !100, size: 32, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !106, file: !105, line: 133, baseType: !100, size: 32, offset: 320)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !106, file: !105, line: 136, baseType: !86, size: 64, offset: 384)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !106, file: !105, line: 137, baseType: !122, size: 64, offset: 448)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DISubroutineType(types: !124)
!124 = !{!100, !86}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !106, file: !105, line: 138, baseType: !126, size: 64, offset: 512)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DISubroutineType(types: !128)
!128 = !{!100, !86, !96, !100}
!129 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !106, file: !105, line: 139, baseType: !130, size: 64, offset: 576)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DISubroutineType(types: !132)
!132 = !{!133, !86, !133, !100}
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !105, line: 81, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !135, line: 71, baseType: !136)
!135 = !DIFile(filename: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types.h", directory: "")
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !93, line: 24, baseType: !137)
!137 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !106, file: !105, line: 140, baseType: !139, size: 64, offset: 640)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = !DISubroutineType(types: !141)
!141 = !{!100, !86, !142, !100}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !97)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !106, file: !105, line: 143, baseType: !115, size: 128, offset: 704)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !106, file: !105, line: 144, baseType: !146, size: 64, offset: 832)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !105, line: 98, flags: DIFlagFwdDecl)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !106, file: !105, line: 145, baseType: !100, size: 32, offset: 896)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !106, file: !105, line: 148, baseType: !150, size: 24, offset: 928)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 24, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 3)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !106, file: !105, line: 149, baseType: !154, size: 8, offset: 952)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 8, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 1)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !106, file: !105, line: 152, baseType: !115, size: 128, offset: 960)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !106, file: !105, line: 155, baseType: !100, size: 32, offset: 1088)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !106, file: !105, line: 156, baseType: !133, size: 64, offset: 1152)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !100)
!162 = !{}
!163 = distinct !DICompileUnit(language: DW_LANG_C99, file: !164, producer: "Chapel version 1.30.0 pre-release (40d2290564)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !162)
!164 = !DIFile(filename: "hello.chpl", directory: "./")
!165 = !{!"Chapel version 1.30.0 pre-release (40d2290564)"}
!166 = distinct !DISubprogram(name: "main", linkageName: "chpl_user_main", scope: !167, file: !164, line: 2, type: !168, scopeLine: 2, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !163, retainedNodes: !170)
!167 = !DINamespace(name: "hello", scope: !164)
!168 = !DISubroutineType(types: !169)
!169 = !{null}
!170 = !{!171}
!171 = !DILocalVariable(name: "local__str_literal_1558", scope: !166, file: !164, line: 3, type: !172)
!172 = !DICompositeType(tag: DW_TAG_structure_type, name: "string", scope: !174, file: !173, size: 320, align: 64, elements: !176)
!173 = !DIFile(filename: "<internal>", directory: "./")
!174 = !DINamespace(name: "String", scope: !175)
!175 = !DIFile(filename: "String.chpl", directory: "/Users/jade/Development/chapel/modules/internal")
!176 = !{!177, !179, !180, !181, !184, !186, !187}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "buffLen", scope: !174, file: !175, line: 671, baseType: !178, size: 64, align: 64)
!178 = !DIBasicType(name: "int(64)", size: 64, encoding: DW_ATE_signed)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "buffSize", scope: !174, file: !175, line: 672, baseType: !178, size: 64, align: 64, offset: 64)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "cachedNumCodepoints", scope: !174, file: !175, line: 673, baseType: !178, size: 64, align: 64, offset: 128)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "buff", scope: !174, file: !175, line: 674, baseType: !182, size: 64, align: 64, offset: 192)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "c_ptr(uint(8))", baseType: !183, size: 64)
!183 = !DIBasicType(name: "uint(8)", size: 8, encoding: DW_ATE_unsigned)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "isOwned", scope: !174, file: !175, line: 675, baseType: !185, size: 8, align: 8, offset: 256)
!185 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_unsigned)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "hasEscapes", scope: !174, file: !175, line: 676, baseType: !185, size: 8, align: 8, offset: 264)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "locale_id", scope: !174, file: !175, line: 679, baseType: !188, size: 32, align: 32, offset: 288)
!188 = !DIBasicType(name: "int(32)", size: 32, encoding: DW_ATE_signed)
!189 = !DILocation(line: 2, scope: !166)
!190 = !DILocation(line: 3, scope: !166)
