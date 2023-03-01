; LLVM IR representation of chpl_user_main function after basic optimization stage
; ModuleID = 'root'
source_filename = "root"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%string_chpl = type { i64, i64, i64, i8*, i8, i8, i32 }

@_str_literal_1558_chpl = external dso_local global %string_chpl

declare dso_local void @writeln_chpl(%string_chpl* nonnull dereferenceable(40))

; Function Attrs: noinline
define weak dso_local void @chpl_user_main() #0 {
  %1 = alloca %string_chpl, align 8
  %2 = bitcast %string_chpl* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %2)
  br label %3

3:                                                ; preds = %0
  %4 = load %string_chpl, %string_chpl* @_str_literal_1558_chpl, align 8
  store %string_chpl %4, %string_chpl* %1, align 8
  %5 = bitcast %string_chpl* %1 to i8*
  %6 = call {}* @llvm.invariant.start.p0i8(i64 40, i8* %5)
  call void @writeln_chpl(%string_chpl* nonnull dereferenceable(40) %1)
  %7 = bitcast %string_chpl* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %7)
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare {}* @llvm.invariant.start.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { noinline }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 3]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Chapel version 1.30.0 pre-release (40d2290564)"}
