<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <xsl:template match="/requirements_specification">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="metadata/project_name"/> - 要件定義書</title>
        <link rel="stylesheet" type="text/css" href="../css/specifications.css"/>
      </head>
      <body>
        <div class="container">
          <!-- ヘッダー -->
          <div class="header">
            <h1><xsl:value-of select="metadata/project_name"/></h1>
            <div class="subtitle">要件定義書</div>
          </div>

          <!-- メタデータ -->
          <div class="metadata">
            <h2>ドキュメント情報</h2>
            <div class="metadata-grid">
              <div class="metadata-item">
                <span class="metadata-label">プロジェクト名</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/project_name != ''">
                      <xsl:value-of select="metadata/project_name"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">バージョン</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/version != ''">
                      <xsl:value-of select="metadata/version"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">作成日</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/creation_date != ''">
                      <xsl:value-of select="metadata/creation_date"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">最終更新日</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/last_modified != ''">
                      <xsl:value-of select="metadata/last_modified"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">作成者</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/author != ''">
                      <xsl:value-of select="metadata/author"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">ステータス</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/status != ''">
                      <xsl:value-of select="metadata/status"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
            </div>
          </div>

          <!-- コンテンツ -->
          <div class="content">
            <!-- プロジェクト概要 -->
            <xsl:if test="project_overview">
              <div class="section">
                <h2 class="section-header">プロジェクト概要</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">目的</h3>
                    <p><xsl:value-of select="project_overview/purpose"/></p>
                  </div>
                  <div class="subsection">
                    <h3 class="subsection-header">範囲</h3>
                    <p><xsl:value-of select="project_overview/scope"/></p>
                  </div>
                  <xsl:if test="project_overview/objectives/objective">
                    <div class="subsection">
                      <h3 class="subsection-header">目標</h3>
                      <ul class="item-list">
                        <xsl:for-each select="project_overview/objectives/objective">
                          <li class="item priority-{@priority}">
                            <div class="item-header">
                              <span class="item-id"><xsl:value-of select="@id"/></span>
                              目標 - 優先度: <xsl:value-of select="@priority"/>
                            </div>
                            <div class="item-content"><xsl:value-of select="."/></div>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </xsl:if>

            <!-- ステークホルダー -->
            <xsl:if test="stakeholders/stakeholder">
              <div class="section">
                <h2 class="section-header">ステークホルダー</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="stakeholders/stakeholder">
                      <li class="item">
                        <div class="item-header">
                          <xsl:value-of select="name"/> (<xsl:value-of select="role"/>)
                        </div>
                        <div class="item-content">
                          <p><strong>責任:</strong> <xsl:value-of select="responsibilities"/></p>
                          <p><strong>連絡先:</strong> <xsl:value-of select="contact_info"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <!-- 機能要件 -->
            <xsl:if test="functional_requirements/requirement">
              <div class="section">
                <h2 class="section-header">機能要件</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="functional_requirements/requirement">
                      <li class="item priority-{@priority}">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="title"/>
                        </div>
                        <div class="item-description">
                          カテゴリ: <xsl:value-of select="@category"/> | 優先度: <xsl:value-of select="@priority"/>
                        </div>
                        <div class="item-content">
                          <p><strong>説明:</strong> <xsl:value-of select="description"/></p>
                          <xsl:if test="user_story != ''">
                            <p><strong>ユーザーストーリー:</strong> <xsl:value-of select="user_story"/></p>
                          </xsl:if>
                          <xsl:if test="acceptance_criteria/criterion">
                            <p><strong>受入基準:</strong></p>
                            <ul>
                              <xsl:for-each select="acceptance_criteria/criterion">
                                <li><xsl:value-of select="."/></li>
                              </xsl:for-each>
                            </ul>
                          </xsl:if>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <!-- 非機能要件 -->
            <xsl:if test="non_functional_requirements">
              <div class="section">
                <h2 class="section-header">非機能要件</h2>
                <div class="section-content">
                  <xsl:if test="non_functional_requirements/performance/requirement">
                    <div class="subsection">
                      <h3 class="subsection-header">パフォーマンス</h3>
                      <ul class="item-list">
                        <xsl:for-each select="non_functional_requirements/performance/requirement">
                          <li class="item">
                            <div class="item-header">
                              <span class="item-id"><xsl:value-of select="@id"/></span>
                              <xsl:value-of select="@metric"/>
                            </div>
                            <div class="item-content">
                              目標値: <xsl:value-of select="@target_value"/>
                            </div>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </div>
                  </xsl:if>

                  <xsl:if test="non_functional_requirements/security/requirement">
                    <div class="subsection">
                      <h3 class="subsection-header">セキュリティ</h3>
                      <ul class="item-list">
                        <xsl:for-each select="non_functional_requirements/security/requirement">
                          <li class="item">
                            <div class="item-header">
                              <span class="item-id"><xsl:value-of select="@id"/></span>
                              <xsl:value-of select="@type"/>
                            </div>
                            <div class="item-content">
                              <xsl:value-of select="@description"/>
                            </div>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </xsl:if>

            <!-- データ要件 -->
            <xsl:if test="data_requirements/entity">
              <div class="section">
                <h2 class="section-header">データ要件</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="data_requirements/entity">
                      <li class="item">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="name"/>
                        </div>
                        <div class="item-content">
                          <p><xsl:value-of select="description"/></p>
                          <xsl:if test="attributes/attribute">
                            <div class="attributes">
                              <xsl:for-each select="attributes/attribute">
                                <div class="attribute">
                                  <span class="attribute-name"><xsl:value-of select="@name"/></span>
                                  <span class="attribute-value">(<xsl:value-of select="@type"/>)</span>
                                </div>
                              </xsl:for-each>
                            </div>
                          </xsl:if>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>
          </div>

          <!-- ナビゲーション -->
          <div class="navigation">
            <div class="nav-links">
              <a href="../index.html" class="nav-link">← 目次に戻る</a>
              <a href="../basic-design/index.html" class="nav-link">基本設計 →</a>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>