package com.onurvar.massiverpg.di

import android.app.Application
import com.onurvar.massiverpg.data.datasource.FirebaseDataSourceImpl
import com.onurvar.massiverpg.data.repository.AuthRepositoryImpl
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseDataSource
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository
import com.onurvar.massiverpg.domain.protocol.usecase.BeginSignInUseCase
import com.onurvar.massiverpg.domain.usecase.BeginSignInUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.CheckSignedInUserUseCase
import com.onurvar.massiverpg.domain.usecase.CheckSignedInUserUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.SignInUseCase
import com.onurvar.massiverpg.domain.usecase.SignInUseCaseImpl
import com.onurvar.massiverpg.domain.protocol.usecase.SignOutUseCase
import com.onurvar.massiverpg.domain.usecase.SignOutUseCaseImpl
import com.onurvar.massiverpg.presentation.viewmodel.HomeViewModel
import com.onurvar.massiverpg.presentation.viewmodel.RootViewModel
import com.onurvar.massiverpg.presentation.viewmodel.SignInViewModel
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    @Singleton
    fun provideFirebaseDataSource(application: Application): FirebaseDataSource {
        return FirebaseDataSourceImpl(application)
    }

    @Provides
    @Singleton
    fun provideAuthRepository(firebaseDataSource: FirebaseDataSource): AuthRepository {
        return AuthRepositoryImpl(firebaseDataSource)
    }

    @Provides
    @Singleton
    fun provideBeginSignInUseCase(authRepository: AuthRepository): BeginSignInUseCase {
        return BeginSignInUseCaseImpl(authRepository)
    }

    @Provides
    @Singleton
    fun provideSignInUseCase(authRepository: AuthRepository): SignInUseCase {
        return SignInUseCaseImpl(authRepository)
    }

    @Provides
    @Singleton
    fun provideCheckSignedInUserUseCase(authRepository: AuthRepository): CheckSignedInUserUseCase {
        return CheckSignedInUserUseCaseImpl(authRepository)
    }

    @Provides
    @Singleton
    fun provideSignOutUseCase(authRepository: AuthRepository): SignOutUseCase {
        return SignOutUseCaseImpl(authRepository)
    }

    @Provides
    fun provideRootViewModel(checkSignedInUserUseCase: CheckSignedInUserUseCase): RootViewModel {
        return RootViewModel(checkSignedInUserUseCase)
    }

    @Provides
    fun provideHomeViewModel(
        application: Application,
        signOutUseCase: SignOutUseCase
    ): HomeViewModel {
        return HomeViewModel(application, signOutUseCase)
    }

    @Provides
    fun provideSignInViewModel(
        application: Application,
        beginSignInUseCase: BeginSignInUseCase, signInUseCase: SignInUseCase
    ): SignInViewModel {
        return SignInViewModel(application, beginSignInUseCase, signInUseCase)
    }

}