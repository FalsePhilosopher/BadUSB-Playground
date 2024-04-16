#include <windows.h>
#include "RaiseHardError.h"

int main() {
    auto ntdll = LoadLibraryA("ntdll.dll");
    if (ntdll == nullptr) {
        return -1;
    }

    auto RtlAdjustPrivilege = (pdef_RtlAdjustPrivilege) GetProcAddress(ntdll, "RtlAdjustPrivilege");
    BOOLEAN enabled;
    if (RtlAdjustPrivilege(SE_SHUTDOWN_PRIVILEGE, TRUE, FALSE, &enabled) != 0) {
        return -1;
    }

    auto NtRaiseHardError = (pdef_NtRaiseHardError) GetProcAddress(ntdll, "NtRaiseHardError");
    ULONG Response;
    NtRaiseHardError(Error_Status, 0, 0, nullptr, OPTION_SHUTDOWN, &Response);

    return 0;
}