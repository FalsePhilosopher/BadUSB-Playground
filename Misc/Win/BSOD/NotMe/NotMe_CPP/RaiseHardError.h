#ifndef TRIGGER_BSOD_RAISEHARDERROR_H
#define TRIGGER_BSOD_RAISEHARDERROR_H

#define Error_Status 0xC0000002
#define SE_SHUTDOWN_PRIVILEGE 0x13
#define OPTION_SHUTDOWN 0x6

typedef NTSTATUS(NTAPI *pdef_RtlAdjustPrivilege)(
        ULONG       Privilege,
        BOOLEAN     Enable,
        BOOLEAN     CurrentThread,
        PBOOLEAN    Enabled
);

typedef NTSTATUS(NTAPI *pdef_NtRaiseHardError)(
        NTSTATUS    ErrorStatus,
        ULONG       NumberOfParameters,
        ULONG       UnicodeStringParameterMask OPTIONAL,
        PULONG_PTR  Parameters,
        ULONG       ResponseOption,
        PULONG      Response
);

typedef NTSTATUS(NTAPI *pdef_ZwRaiseHardError)(
        NTSTATUS    ErrorStatus,
        ULONG       NumberOfParameters,
        ULONG       UnicodeStringParameterMask OPTIONAL,
        PULONG_PTR  Parameters,
        ULONG       ResponseOption,
        PULONG      Response
);

#endif //TRIGGER_BSOD_RAISEHARDERROR_H
