/*
 * Module: semaphore.h
 *
 * Purpose:
 *	Semaphores aren't actually part of the PThreads standard.
 *	They are defined by the POSIX Standard:
 *
 *		POSIX 1003.1b-1993	(POSIX.1b)
 *
 * --------------------------------------------------------------------------
 *
 *      Pthreads-win32 - POSIX Threads Library for Win32
 *      Copyright(C) 1998 John E. Bossom
 *      Copyright(C) 1999-2012, 2016, Pthreads-win32 contributors
 *
 *      Homepage1: http://sourceware.org/pthreads-win32/
 *      Homepage2: http://sourceforge.net/projects/pthreads4w/
 *
 *      The current list of contributors is contained
 *      in the file CONTRIBUTORS included with the source
 *      code distribution. The list can also be seen at the
 *      following World Wide Web location:
 *      http://sources.redhat.com/pthreads-win32/contributors.html
 *
 *      This library is free software; you can redistribute it and/or
 *      modify it under the terms of the GNU Lesser General Public
 *      License as published by the Free Software Foundation; either
 *      version 2 of the License, or (at your option) any later version.
 *
 *      This library is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *      Lesser General Public License for more details.
 *
 *      You should have received a copy of the GNU Lesser General Public
 *      License along with this library in the file COPYING.LIB;
 *      if not, write to the Free Software Foundation, Inc.,
 *      59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 */
#ifndef _SEMAPHORE_H
#define _SEMAPHORE_H

/* FIXME: POSIX.1 says that _POSIX_SEMAPHORES should be defined
 * in <unistd.h>, not here; for later POSIX.1 versions, its value
 * should match the corresponding _POSIX_VERSION number, but in
 * the case of POSIX.1b-1993, the value is unspecified.
 *
 * Notwithstanding the above, since POSIX semaphores, (and indeed
 * having any <unistd.h> to #include), are not a standard feature
 * on MS-Windows, it is convenient to retain this definition here;
 * we may consider adding a hook, to make it selectively available
 * for inclusion by <unistd.h>, in those cases (e.g. MinGW) where
 * <unistd.h> is provided.
 */
#define _POSIX_SEMAPHORES

/* Internal macros, common to the public interfaces for various
 * pthreads-win32 components, are defined in <_ptw32.h>; we must
 * include them here.
 */
#include <_ptw32.h>

/* The sem_timedwait() function was added in POSIX.1-2001; it
 * requires struct timespec to be defined, at least as a partial
 * (a.k.a. incomplete) data type.  Forward declare it as such.
 */
struct timespec;

/* The data type used to represent our semaphore implementation,
 * as required by POSIX.1; FIXME: consider renaming the underlying
 * structure tag, to avoid possible pollution of user namespace.
 */
typedef struct sem_t_ * sem_t;

/* POSIX.1b (and later) mandates SEM_FAILED as the value to be
 * returned on failure of sem_open(); (our implementation is a
 * stub, which will always return this).
 */
#define SEM_FAILED  (sem_t *)(-1)

__PTW32_BEGIN_C_DECLS

/* Function prototypes: some are implemented as stubs, which
 * always fail; (FIXME: identify them).
 */
__PTW32_DECLSPEC int sem_init (sem_t * sem, int pshared, unsigned int value);
__PTW32_DECLSPEC int sem_destroy (sem_t * sem);
__PTW32_DECLSPEC int sem_trywait (sem_t * sem);
__PTW32_DECLSPEC int sem_wait (sem_t * sem);
__PTW32_DECLSPEC int sem_timedwait (sem_t * sem, const struct timespec * abstime);
__PTW32_DECLSPEC int sem_post (sem_t * sem);
__PTW32_DECLSPEC int sem_post_multiple (sem_t * sem, int count);
__PTW32_DECLSPEC sem_t *sem_open (const char *, int, ...);
__PTW32_DECLSPEC int sem_close (sem_t * sem);
__PTW32_DECLSPEC int sem_unlink (const char * name);
__PTW32_DECLSPEC int sem_getvalue (sem_t * sem, int * sval);

__PTW32_END_C_DECLS

#endif	/* !_SEMAPHORE_H */
